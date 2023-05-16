library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Include the PacketType library so that we can use the eCmpFunc type
library work;
use work.PacketType.all;

entity DepthBuffer is
	generic (
		NUM_PIPELINE_STAGES : natural range 2 to 31 := 4
	);
    Port (
		clk	: in std_logic;

	-- Per-pixel input data begin
		RAST_PixelReady : in STD_LOGIC;
		RAST_PosX : in STD_LOGIC_VECTOR(9 downto 0);
		RAST_PosY : in STD_LOGIC_VECTOR(9 downto 0);
		RAST_InPixelDepth : in STD_LOGIC_VECTOR(23 downto 0);
	-- Per-pixel input data end

	-- State config data begin
		RAST_SetDepthParams : in STD_LOGIC;
		RAST_DepthWriteEnable : in STD_LOGIC;
		RAST_DepthFunction : in STD_LOGIC_VECTOR(2 downto 0);
		RAST_DepthIsIdle : out STD_LOGIC := '0';
	-- State config data end

	-- Per-pixel output data begin
		RAST_PixelPassedDepthTest : out STD_LOGIC := '0';
		RAST_PixelFailedDepthTest : out STD_LOGIC := '0';
	-- Per-pixel output data end

	-- URAM Interface begin
		URAM_addra : out STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
		URAM_clka : out STD_LOGIC := '0';
		URAM_dina : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0');
		URAM_ena : out STD_LOGIC := '1';
		URAM_wea : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

		URAM_addrb : out STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
		URAM_clkb : out STD_LOGIC := '0';
		URAM_doutb : in STD_LOGIC_VECTOR(63 downto 0);
		URAM_enb : out STD_LOGIC := '1';
	-- URAM Interface end

	-- Command Processor interface begin
		CMD_ClearDepthBuffer : in STD_LOGIC;
		CMD_ClearDepthValue : in STD_LOGIC_VECTOR(23 downto 0);
		CMD_DepthIsIdle : out STD_LOGIC := '0';
	-- Command Processor interface end

	-- Stats interface begin
		STAT_PixelsPassedDepthTest : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_PixelsFailedDepthTest : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
	-- Stats interface end
		);
end DepthBuffer;

architecture Behavioral of DepthBuffer is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

	ATTRIBUTE X_INTERFACE_INFO of URAM_clka: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of URAM_clka: SIGNAL is "FREQ_HZ 333250000";
	ATTRIBUTE X_INTERFACE_INFO of URAM_ena: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW EN";
	ATTRIBUTE X_INTERFACE_INFO of URAM_dina: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
	ATTRIBUTE X_INTERFACE_INFO of URAM_wea: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
	ATTRIBUTE X_INTERFACE_INFO of URAM_addra: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";

	ATTRIBUTE X_INTERFACE_INFO of URAM_clkb: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMR CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of URAM_clkb: SIGNAL is "FREQ_HZ 333250000";
	ATTRIBUTE X_INTERFACE_INFO of URAM_enb: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMR EN";
	ATTRIBUTE X_INTERFACE_INFO of URAM_addrb: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
	ATTRIBUTE X_INTERFACE_INFO of URAM_doutb: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMR DOUT";

	type PipelineDepthTest is record
		pixelEnabled : std_logic;
		isOddAddress : std_logic;
		pixelAddress : unsigned(17 downto 0);
		pixelTestDepth : unsigned(23 downto 0);
	end record PipelineDepthTest;

	constant DefaultPipelineDepthTestVal : PipelineDepthTest := (pixelEnabled => '0', isOddAddress => '0', pixelAddress => (others => '0'), pixelTestDepth => (others => '0') );

	type PipelineDepthTestArrayType is array(NUM_PIPELINE_STAGES downto 0) of PipelineDepthTest;

	signal currentDepthCompareFunc : eCmpFunc := cmp_lessequal; -- D3DRS_ZFUNC defaults to D3DCMP_LESSEQUAL
	signal depthWriteEnable : std_logic := '1'; -- D3DRS_ZWRITEENABLE defaults to TRUE

	-- Clear mode registers:
	signal clearSaveDepthCompareFunc : eCmpFunc := cmp_lessequal;
	signal clearSaveDepthWriteEnable : std_logic := '1';
	signal clearModeEnable : std_logic := '0';
	signal clearModeAddress : unsigned(17 downto 0) := (others => '0');
	signal clearDepthValue : unsigned(23 downto 0) := (others => '0');
	signal clearModeCompleted : std_logic := '0';
	constant finishClearPixelCount : natural := ( (480-1) * (640/2) + ( (640/2)-1) );

	signal depthPipeline : PipelineDepthTestArrayType := (others => DefaultPipelineDepthTestVal);

	signal pixelsPassedDepthTest : unsigned(31 downto 0) := (others => '0');
	signal pixelsFailedDepthTest : unsigned(31 downto 0) := (others => '0');

	pure function MultiplyBy320(value : unsigned(9 downto 0) ) return unsigned is
	begin
		return ( (resize(value, 18) sll 6) + (resize(value, 18) sll 8) );
	end function;

	-- Returns true if the pixel passed the depth test, or false if the pixel didn't pass the depth test
	pure function DepthTest(depthFunc : eCmpFunc; testPixelValue : unsigned(23 downto 0); depthBufferCurrentValue : unsigned(23 downto 0) ) return boolean is
	begin
		case depthFunc is
			when cmp_less =>
				return testPixelValue < depthBufferCurrentValue;
			when cmp_equal =>
				return testPixelValue = depthBufferCurrentValue;
			when cmp_lessequal =>
				return testPixelValue <= depthBufferCurrentValue;
			when cmp_greater =>
				return testPixelValue > depthBufferCurrentValue;
			when cmp_notequal =>
				return testPixelValue /= depthBufferCurrentValue;
			when cmp_greaterequal =>
				return testPixelValue >= depthBufferCurrentValue;
			when cmp_always =>
				return true;
			when others => -- when cmp_never =>
				return false;
		end case;
	end function;

	pure function DepthBufferBlockIsIdle(depthPipelineArray : PipelineDepthTestArrayType) return std_logic is
	begin
		for i in 0 to NUM_PIPELINE_STAGES loop
			if (depthPipelineArray(i).pixelEnabled = '1') then
				return '0';
			end if;
		end loop;
		return '1';
	end function;

begin
	STAT_PixelsPassedDepthTest <= std_logic_vector(pixelsPassedDepthTest);
	STAT_PixelsFailedDepthTest <= std_logic_vector(pixelsFailedDepthTest);

	URAM_clka <= clk;
	URAM_clkb <= clk;

	setParamsProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (clearModeEnable = '1') then -- Currently in the middle of performing a full-buffer clear:
				if (clearModeCompleted = '1') then
					clearModeEnable <= '0';
					currentDepthCompareFunc <= clearSaveDepthCompareFunc; -- Restore our depth func to what it was originally
					depthWriteEnable <= clearSaveDepthWriteEnable;
				end if;

				CMD_DepthIsIdle <= '0';
				RAST_DepthIsIdle <= '0';
			else
				if (RAST_SetDepthParams = '1') then
					currentDepthCompareFunc <= eCmpFunc'val(to_integer(unsigned(RAST_DepthFunction) ) );
					depthWriteEnable <= RAST_DepthWriteEnable;
					CMD_DepthIsIdle <= '0';
					RAST_DepthIsIdle <= '0';
				elsif (CMD_ClearDepthBuffer = '1') then
					clearModeEnable <= '1';
					clearDepthValue <= unsigned(CMD_ClearDepthValue);

					-- Save our depth func and depth write enable state to be restored after the clear finishes
					clearSaveDepthCompareFunc <= currentDepthCompareFunc;
					clearSaveDepthWriteEnable <= depthWriteEnable;

					-- Override our depth settings to D3DRS_ZWRITEENABLE=1 and D3DRS_ZFUNC=D3DCMP_ALWAYS for the duration of the Clear process:
					currentDepthCompareFunc <= cmp_always;
					depthWriteEnable <= '1';

					CMD_DepthIsIdle <= '0';
					RAST_DepthIsIdle <= '0';
				else
					CMD_DepthIsIdle <= DepthBufferBlockIsIdle(depthPipeline) and not RAST_PixelReady;
					RAST_DepthIsIdle <= DepthBufferBlockIsIdle(depthPipeline) and not RAST_PixelReady;
				end if;
			end if;
		end if;
	end process setParamsProcess;

	clearProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (clearModeEnable = '1') then
				if (clearModeAddress >= finishClearPixelCount) then
					clearModeAddress <= (others => '0');
					clearModeCompleted <= '1';
				else
					clearModeAddress <= clearModeAddress + 1;
					clearModeCompleted <= '0';
				end if;
			end if;
		end if;
	end process clearProcess;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			for i in 1 to NUM_PIPELINE_STAGES loop
				depthPipeline(i) <= depthPipeline(i - 1);
			end loop;

			depthPipeline(0) <= DefaultPipelineDepthTestVal;
			depthPipeline(0).pixelEnabled <= RAST_PixelReady;
			if (clearModeEnable = '1') then
				depthPipeline(0).pixelEnabled <= '1';
				depthPipeline(0).isOddAddress <= '0';
				depthPipeline(0).pixelAddress <= clearModeAddress;
				depthPipeline(0).pixelTestDepth <= clearDepthValue;
				URAM_addrb <= (others => '0');
			elsif (RAST_PixelReady = '1') then
				depthPipeline(0).isOddAddress <= RAST_PosX(0);
				depthPipeline(0).pixelAddress <= MultiplyBy320(unsigned(RAST_PosY) ) + unsigned(RAST_PosX(9 downto 1) );
				depthPipeline(0).pixelTestDepth <= unsigned(RAST_InPixelDepth);
				URAM_addrb <= std_logic_vector(MultiplyBy320(unsigned(RAST_PosY) ) + unsigned(RAST_PosX(9 downto 1) ) );
			end if;
		end if;
	end process;

	process(clk)
		variable passedDepthTest : boolean;
	begin
		if (rising_edge(clk) ) then
			RAST_PixelPassedDepthTest <= '0';
			RAST_PixelFailedDepthTest <= '0';
			URAM_wea <= (others => '0');
			if (depthPipeline(NUM_PIPELINE_STAGES).pixelEnabled = '1') then
				if (depthPipeline(NUM_PIPELINE_STAGES).isOddAddress = '0') then
					passedDepthTest := DepthTest(currentDepthCompareFunc, depthPipeline(NUM_PIPELINE_STAGES).pixelTestDepth, unsigned(URAM_doutb(23 downto 0) ) );
				else
					passedDepthTest := DepthTest(currentDepthCompareFunc, depthPipeline(NUM_PIPELINE_STAGES).pixelTestDepth, unsigned(URAM_doutb(55 downto 32) ) );
				end if;

				if (passedDepthTest) then
					RAST_PixelPassedDepthTest <= '1';

					if (depthWriteEnable = '1') then
						URAM_addra <= std_logic_vector(depthPipeline(NUM_PIPELINE_STAGES).pixelAddress);

						if (clearModeEnable = '0') then
							if (depthPipeline(NUM_PIPELINE_STAGES).isOddAddress = '0') then
								URAM_dina(63 downto 56) <= (others => '0');
								URAM_dina(55 downto 32) <= (others => '0');
								URAM_dina(31 downto 24) <= (others => '0');
								URAM_dina(23 downto 0) <= std_logic_vector(depthPipeline(NUM_PIPELINE_STAGES).pixelTestDepth);
								URAM_wea <= "00001111";
							else
								URAM_dina(63 downto 56) <= (others => '0');
								URAM_dina(55 downto 32) <= std_logic_vector(depthPipeline(NUM_PIPELINE_STAGES).pixelTestDepth);
								URAM_dina(31 downto 24) <= (others => '0');
								URAM_dina(23 downto 0) <= (others => '0');
								URAM_wea <= "11110000";
							end if;
						else
							URAM_dina(63 downto 56) <= (others => '0');
							URAM_dina(55 downto 32) <= std_logic_vector(depthPipeline(NUM_PIPELINE_STAGES).pixelTestDepth);
							URAM_dina(31 downto 24) <= (others => '0');
							URAM_dina(23 downto 0) <= std_logic_vector(depthPipeline(NUM_PIPELINE_STAGES).pixelTestDepth);
							URAM_wea <= "11111111";
						end if;
					end if;

					if (clearModeEnable = '0') then
						pixelsPassedDepthTest <= pixelsPassedDepthTest + 1;
					end if;
				else
					RAST_PixelFailedDepthTest <= '1';
					pixelsFailedDepthTest <= pixelsFailedDepthTest + 1;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
