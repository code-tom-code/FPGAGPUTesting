library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Include the PacketType library so that we can use the eCmpFunc type
library work;
use work.PacketType.all;

entity DepthBufferTestbench is
	generic (
		NUM_PIPELINE_STAGES : natural range 2 to 31 := 3
	);
    Port (
		clk	: in std_logic;
		clk_locked : in std_logic;

	-- Per-pixel input data begin
		RAST_PixelReady : out STD_LOGIC := '0';
		RAST_PosX : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		RAST_PosY : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		RAST_InPixelDepth : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
	-- Per-pixel input data end

	-- Per-pixel output data begin
		RAST_PixelPassedDepthTest : in STD_LOGIC;
	-- Per-pixel output data end

	-- Command Processor interface begin
		CMD_ClearDepthBuffer : out STD_LOGIC := '0';
		CMD_ClearDepthValue : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		CMD_DepthWriteEnable : out STD_LOGIC := '0';
		CMD_DepthFunction : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		CMD_SetDepthParams : out STD_LOGIC := '0';
		CMD_IsIdle : in STD_LOGIC;
	-- Command Processor interface end

		DBG_TestbenchState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0')
		);
end DepthBufferTestbench;

architecture Behavioral of DepthBufferTestbench is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333251231";

	type testState is (
		InitState, -- 0
		SetInitialParamsState, -- 1
		ClearAllState, -- 2
		WaitForClearFinish, -- 3
		WaitForClearFinish2, -- 4
		TestDrawsAgainstClearedDepth, -- 5
		TestDrawsAgainstWrittenDepth, -- 6
		WaitForDrawFinish, -- 7
		WaitForDrawFinish2, -- 8
		SetEqualsMode, -- 9
		TestDrawsAgainstEquals -- 10
	);

	signal currentState : testState := InitState;
	signal pixelCount : unsigned(3 downto 0) := (others => '0');

begin

	DBG_TestbenchState <= std_logic_vector(to_unsigned(testState'pos(currentState), 4) );
	
	process(clk)
	begin
		if (rising_edge(clk) ) then
			if (clk_locked = '1') then
				CMD_ClearDepthBuffer <= '0';
				CMD_SetDepthParams <= '0';
				RAST_PixelReady <= '0';
				if (CMD_IsIdle = '1') then
					case currentState is
						when InitState =>
							currentState <= SetInitialParamsState;

						when SetInitialParamsState =>
							CMD_SetDepthParams <= '1';
							CMD_DepthFunction <= std_logic_vector(to_unsigned(eCmpFunc'pos(cmp_lessequal), 3) );
							CMD_DepthWriteEnable <= '1';
							currentState <= ClearAllState;

						when ClearAllState =>
							CMD_ClearDepthBuffer <= '1';
							CMD_ClearDepthValue <= X"800000"; -- Clear to a depth of 1.0f
							currentState <= WaitForClearFinish;

						when WaitForClearFinish =>
							currentState <= WaitForClearFinish2;

						when WaitForClearFinish2 =>
							currentState <= TestDrawsAgainstClearedDepth;

						when TestDrawsAgainstClearedDepth =>
							RAST_PixelReady <= '1';
							RAST_PosX <= std_logic_vector(to_unsigned(321, 10) + pixelCount);
							RAST_PosY <= std_logic_vector(to_unsigned(241, 10) );
							RAST_InPixelDepth <= X"7D70A4"; -- 0.99f
							if (pixelCount >= 10) then
								pixelCount <= (others => '0');
								currentState <= TestDrawsAgainstWrittenDepth;
							else
								pixelCount <= pixelCount + 1;
							end if;

						when TestDrawsAgainstWrittenDepth =>
							RAST_PixelReady <= '1';
							RAST_PosX <= std_logic_vector(to_unsigned(321, 10) + pixelCount);
							RAST_PosY <= std_logic_vector(to_unsigned(241, 10) );
							RAST_InPixelDepth <= X"7EB852"; -- 0.995f
							if (pixelCount >= 10) then
								pixelCount <= (others => '0');
								currentState <= WaitForDrawFinish;
							else
								pixelCount <= pixelCount + 1;
							end if;

						when WaitForDrawFinish =>
							currentState <= WaitForDrawFinish2;

						when WaitForDrawFinish2 =>
							currentState <= SetEqualsMode;

						when SetEqualsMode =>
							CMD_SetDepthParams <= '1';
							CMD_DepthFunction <= std_logic_vector(to_unsigned(eCmpFunc'pos(cmp_equal), 3) );
							CMD_DepthWriteEnable <= '1';
							currentState <= TestDrawsAgainstEquals;

						when TestDrawsAgainstEquals =>
							RAST_PixelReady <= '1';
							RAST_PosX <= std_logic_vector(to_unsigned(321, 10) + pixelCount);
							RAST_PosY <= std_logic_vector(to_unsigned(241, 10) );
							RAST_InPixelDepth <= X"7D70A4"; -- 0.99f
							pixelCount <= pixelCount + 1;
					end case;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
