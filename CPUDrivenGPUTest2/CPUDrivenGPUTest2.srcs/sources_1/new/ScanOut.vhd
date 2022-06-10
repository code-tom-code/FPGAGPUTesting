library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity ScanOut is
	Port (clk : in STD_LOGIC;

	-- Command Processor interfaces begin
		CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_ScanoutEnable : in STD_LOGIC;
	-- Command Processor interfaces end

	-- Misc interface begin
		outXCoord : out STD_LOGIC_VECTOR(9 downto 0); -- 0 to 639
		outYCoord : out STD_LOGIC_VECTOR(9 downto 0); -- 0 to 479
	-- Misc interface end

	-- Memory Controller FIFO interface begin
		-- DRAM read requests FIFO:
		MEM_ScanoutReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
        MEM_ScanoutReadRequestsFIFO_full : in STD_LOGIC;
        MEM_ScanoutReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		-- DRAM read responses FIFO:
		MEM_ScanoutReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(256+30-1 downto 0);
        MEM_ScanoutReadResponsesFIFO_empty : in STD_LOGIC;
        MEM_ScanoutReadResponsesFIFO_rd_en : out STD_LOGIC := '0';
	-- Memory Controller FIFO interface end

	-- VGA interface begin
		vsync : out STD_LOGIC;
		hsync : out STD_LOGIC;
		outR : out STD_LOGIC_VECTOR(7 downto 0);
		outG : out STD_LOGIC_VECTOR(7 downto 0);
		outB : out STD_LOGIC_VECTOR(7 downto 0);
	-- VGA interface end

	-- Debug signals
		DBG_ScanoutLoadProcess_State : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0')
		);
end ScanOut;

architecture Behavioral of ScanOut is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses EMPTY";

type loadProcessState is
(
	loadProcessInit, -- 0
	waitForEmptyCacheLine, -- 1
	readSendSecondAddr, -- 2
	waitForMemRead, -- 3
	waitForMemRead2, -- 4
	waitForMemRead3, -- 5
	waitForCacheLineFill -- 6
);

signal loadState : loadProcessState := loadProcessInit;
signal loadCacheLineNum : unsigned(2 downto 0) := (others => '0');

signal lineNumber : unsigned(9 downto 0) := (others => '0'); -- stores values from 0 to 1024, but we only need from 0 to 525
signal pixelNumber : unsigned(9 downto 0) := (others => '0'); -- stores values from 0 to 1024, but we only need from 0 to 800
signal frameNumber : unsigned(9 downto 0) := (others => '0');
signal clockDividerCounter8 : unsigned(2 downto 0) := (others => '0');

-- Cached command signals:
signal scanoutEnable_lastCycle : std_logic := '0';
signal scanoutEnable : std_logic := '0';
signal BaseRenderTargetAddr_lastCycle : STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
signal BaseRenderTargetAddr : STD_LOGIC_VECTOR(29 downto 0) := (others => '0');

-- Let's cache a few DRAM lines ahead:
-- 0 lines ahead:
signal currentCachedLine : unsigned(511 downto 0) := (others => '0');
signal currentCachedLineAddr : unsigned(29 downto 0) := (others => '0');

-- 1 lines ahead:
signal nextCachedLine : unsigned(511 downto 0) := (others => '0');
signal nextCachedLineAddr : unsigned(29 downto 0) := (others => '0');

-- 2 lines ahead:
signal loadingCachedLine : unsigned(511 downto 0) := (others => '0');
signal loadingCachedLineOffset : unsigned(29 downto 0) := (others => '0');
signal loadingLineLoaded : std_logic := '0';
signal loadingLineReady : std_logic := '0';

pure function GetXCoord(pixelNumber : unsigned(9 downto 0) ) return unsigned is
begin
	return pixelNumber - 48;
end function;

pure function GetYCoord(lineNumber : unsigned(9 downto 0) ) return unsigned is
begin
	return lineNumber - 33;
end function;

pure function IsCurrentPixelBlanked(pixelNumber : unsigned(9 downto 0); lineNumber : unsigned(9 downto 0) ) return std_logic is
begin
	if (lineNumber >= 35 and lineNumber < 515 and pixelNumber >= 48 and pixelNumber < 688) then
		return '0';
	else
		return '1';
	end if;
end function;

begin

DBG_ScanoutLoadProcess_State <= std_logic_vector(to_unsigned(loadProcessState'pos(loadState), 4) );

vsync <= '1' when (lineNumber < 2) else '0'; -- For 640x480@60Hz mode, vsync signal is active-high
hsync <= '1' when (pixelNumber < 704) else '0'; -- For 640x480@60Hz mode, hsync signal is active-low

	process(clk)
	begin
		if (rising_edge(clk) ) then
			scanoutEnable_lastCycle <= CMD_ScanoutEnable;
			scanoutEnable <= scanoutEnable_lastCycle and CMD_ScanoutEnable;

			BaseRenderTargetAddr_lastCycle <= CMD_BaseRenderTargetAddr;
			BaseRenderTargetAddr <= BaseRenderTargetAddr_lastCycle and CMD_BaseRenderTargetAddr;
		end if;
	end process;

	process(clk)
		variable tempXCoord : unsigned(9 downto 0) := (others => '0');
	begin
		if (rising_edge(clk) ) then
			if (clockDividerCounter8 = 7) then
				clockDividerCounter8 <= (others => '0');

				-- Do stuff here on every 8th tick:
				if (lineNumber > 513) then
					-- Spend some VSync lines pre-warming our cache for the top of the next frame
					if (pixelNumber = 0) then
						if (lineNumber = 517) then
							-- Reset the loading cache line addr to the base specified by the Command Processor when we reach the bottom of the scan region
							loadingCachedLineOffset <= (others => '0');
							loadingLineLoaded <= '0';
						elsif (lineNumber = 519) then
							currentCachedLine <= loadingCachedLine; -- Offset +00
							currentCachedLineAddr <= loadingCachedLineOffset;

							loadingCachedLineOffset <= to_unsigned(64, 30); -- Increment the read address by 512 bits forwards (64 bytes)
							loadingLineLoaded <= '0'; -- Mark the loaded cache line as unloaded and needing to be loaded
						elsif (lineNumber = 521) then
							nextCachedLine <= loadingCachedLine; -- Offset +64
							nextCachedLineAddr <= loadingCachedLineOffset;

							loadingCachedLineOffset <= to_unsigned(128, 30); -- Increment the read address by 512 bits forwards (64 bytes)
							loadingLineLoaded <= '0'; -- Mark the loaded cache line as unloaded and needing to be loaded
						end if;
					end if;
				end if;

				if (IsCurrentPixelBlanked(pixelNumber, lineNumber) = '0') then
					tempXCoord := GetXCoord(pixelNumber);
					outXCoord <= std_logic_vector(tempXCoord);
					outYCoord <= std_logic_vector(GetYCoord(lineNumber) );
					outR <= std_logic_vector(currentCachedLine(7 downto 0) );
					outG <= std_logic_vector(currentCachedLine(15 downto 8) );
					outB <= std_logic_vector(currentCachedLine(23 downto 16) );

					--outR <= std_logic_vector(loadingCachedLineOffset(7 downto 0) );
					--outG <= std_logic_vector(loadingCachedLineOffset(15 downto 8) );
					--outB <= std_logic_vector(loadingCachedLineOffset(23 downto 16) );

					if (tempXCoord(3 downto 0) = 15) then
						currentCachedLine <= nextCachedLine;
						currentCachedLineAddr <= nextCachedLineAddr;

						nextCachedLine <= loadingCachedLine;
						nextCachedLineAddr <= loadingCachedLineOffset;

						loadingCachedLineOffset <= loadingCachedLineOffset + 64; -- Increment the read address by 512 bits forwards (64 bytes)
						loadingLineLoaded <= '0'; -- Mark the loaded cache line as unloaded and needing to be loaded
					else
						currentCachedLine <= currentCachedLine srl 32; -- Shift the current cache line down one R8G8B8A8 pixel (shift 32 bits to the right)
					end if;
				else
					outXCoord <= (others => '0');
					outYCoord <= (others => '0');
					outR <= (others => '0');
					outG <= (others => '0');
					outB <= (others => '0');
				end if;

				if (lineNumber = 524) then -- 524 = 0x20C
					lineNumber <= (others => '0');
					pixelNumber <= (others => '0');

					frameNumber <= frameNumber + 1;
				else
					if (pixelNumber = 799) then -- 799 = 0x31F
						pixelNumber <= (others => '0');
						lineNumber <= lineNumber + 1;
					else
						pixelNumber <= pixelNumber + 1;
						lineNumber <= lineNumber;
					end if;
				end if;

			else
				if (scanoutEnable = '1') then
					clockDividerCounter8 <= clockDividerCounter8 + 1; -- Only advance our clock counter if scanout is enabled
				end if;
				if (loadingLineReady = '1') then
					loadingLineLoaded <= '1'; -- Ack our new cache line being loaded
				end if;
			end if;
		end if;
	end process;

	-- Data loading process
	process(clk)
	begin
		if (rising_edge(clk) ) then
			case loadState is
				when loadProcessInit =>
					MEM_ScanoutReadResponsesFIFO_rd_en <= '0';
					MEM_ScanoutReadRequestsFIFO_wr_en <= '0';
					loadingLineReady <= '0';
					loadingCachedLine <= loadingCachedLine + 1;
					if (loadingCachedLine > 1023) then -- Give this unit 1000 cycles to warm up
						loadState <= waitForEmptyCacheLine;
					end if;

				when waitForEmptyCacheLine =>
					loadCacheLineNum <= (others => '0'); -- Reset our cache line count
					MEM_ScanoutReadResponsesFIFO_rd_en <= '0';
					if (loadingLineLoaded = '0' and MEM_ScanoutReadRequestsFIFO_full = '0') then
						MEM_ScanoutReadRequestsFIFO_wr_data <= std_logic_vector(loadingCachedLineOffset + unsigned(BaseRenderTargetAddr) );
						MEM_ScanoutReadRequestsFIFO_wr_en <= '1';

						-- Init the line to magenta so we can easily visually tell when we underflow the buffer
						loadingCachedLine <= x"FFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CC";

						loadState <= readSendSecondAddr;
					else
						MEM_ScanoutReadRequestsFIFO_wr_en <= '0';
					end if;

				when readSendSecondAddr =>
					if (loadCacheLineNum = 0) then
						MEM_ScanoutReadRequestsFIFO_wr_en <= '0';
						loadCacheLineNum <= to_unsigned(1, 3);
					elsif (loadCacheLineNum = 1) then
						if (MEM_ScanoutReadRequestsFIFO_full = '0') then
							MEM_ScanoutReadRequestsFIFO_wr_data <= std_logic_vector(loadingCachedLineOffset + unsigned(BaseRenderTargetAddr) + to_unsigned(32, 30) );
							MEM_ScanoutReadRequestsFIFO_wr_en <= '1';
							loadCacheLineNum <= (others => '0');
							loadState <= waitForMemRead;
						end if;
					end if;

				when waitForMemRead =>
					MEM_ScanoutReadRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
					if (MEM_ScanoutReadResponsesFIFO_empty = '0') then
						loadingCachedLine(255 downto 0) <= unsigned(MEM_ScanoutReadResponsesFIFO_rd_data(255 downto 0) );
						MEM_ScanoutReadResponsesFIFO_rd_en <= '1';
						loadState <= waitForMemRead2;
					else
						MEM_ScanoutReadResponsesFIFO_rd_en <= '0';
					end if;

				when waitForMemRead2 =>
					MEM_ScanoutReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
					loadState <= waitForMemRead3;

				when waitForMemRead3 =>
					if (MEM_ScanoutReadResponsesFIFO_empty = '0') then
						MEM_ScanoutReadResponsesFIFO_rd_en <= '1';
						loadingCachedLine(511 downto 256) <= unsigned(MEM_ScanoutReadResponsesFIFO_rd_data(255 downto 0) );
						loadState <= waitForCacheLineFill;
					else
						MEM_ScanoutReadResponsesFIFO_rd_en <= '0';
					end if;

				when waitForCacheLineFill =>
					MEM_ScanoutReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
					if (loadingLineLoaded = '1') then
						loadingLineReady <= '0';
						loadState <= waitForEmptyCacheLine;
					else
						loadingLineReady <= '1';
					end if;
			end case;
		end if;
	end process;

end Behavioral;
