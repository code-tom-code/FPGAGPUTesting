
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.FloatALU_Types.all;

entity FloatALU_Interpolator is
    Port (clk : in STD_LOGIC;

		IN_B : in STD_LOGIC_VECTOR(31 downto 0);
		IN_C : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr0 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr10 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr20 : in STD_LOGIC_VECTOR(31 downto 0);

		OINTERP : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		--DBG_Prod0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		--DBG_Prod1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		--DBG_Add0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		--DBG_Add1Input : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		--DBG_PipelinedGoSig : out STD_LOGIC_VECTOR(MUL_CYCLES+ADD_CYCLES-1 downto 0) := (others => '0');

		-- INTERP pipe operates in 5+4+4=13 clock cycles.
		IINTERP_GO : in STD_LOGIC
		);
end FloatALU_Interpolator;

architecture Behavioral of FloatALU_Interpolator is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

COMPONENT StandaloneFloatALU_MUL
Port (clk : in STD_LOGIC;

	-- Common ports shared across multiple stages:
	IN_A : in STD_LOGIC_VECTOR(31 downto 0);
	IN_B : in STD_LOGIC_VECTOR(31 downto 0);
	OMUL : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	-- MUL pipe operates in 5 clock cycles
	IMUL_GO : in STD_LOGIC
	);
END COMPONENT;

COMPONENT StandaloneFloatALU_ADD
Port (clk : in STD_LOGIC;

	-- Common ports shared across multiple stages:
	IN_A : in STD_LOGIC_VECTOR(31 downto 0);
	IN_B : in STD_LOGIC_VECTOR(31 downto 0);
	OADD : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	-- ADD pipe operates in 4 clock cycles
	IADD_GO : in STD_LOGIC
	);
END COMPONENT;

type AttributePipelineArrayType is array(MUL_CYCLES+ADD_CYCLES-1 downto 0) of std_logic_vector(31 downto 0);

-- These are just temporary wires that are used to connect the output of one ALU element to the input of the next:
signal multResultAttr10 : std_logic_vector(31 downto 0) := (others => '0');
signal multResultAttr20 : std_logic_vector(31 downto 0) := (others => '0');
signal addResult0 : std_logic_vector(31 downto 0) := (others => '0');

-- These are pipelined signals that need to be propogated through to later stages:
signal pipelinedAttr0 : AttributePipelineArrayType := (others => (others => '0') );
signal pipelinedGoSignal : std_logic_vector(MUL_CYCLES+ADD_CYCLES-1 downto 0) := (others => '0');

begin

-- These are the instantiations of our ALU elements:
Multiplier0 : StandaloneFloatALU_MUL port map (clk => clk, IN_A => IN_B, IN_B => IN_Attr10, IMUL_GO => IINTERP_GO, OMUL => multResultAttr10);
Multiplier1 : StandaloneFloatALU_MUL port map (clk => clk, IN_A => IN_C, IN_B => IN_Attr20, IMUL_GO => IINTERP_GO, OMUL => multResultAttr20);
Adder0 : StandaloneFloatALU_ADD port map (clk => clk, IN_A => multResultAttr10, IN_B => multResultAttr20, IADD_GO => pipelinedGoSignal(MUL_CYCLES-1), OADD => addResult0);
Adder1 : StandaloneFloatALU_ADD port map (clk => clk, IN_A => addResult0, IN_B => pipelinedAttr0(MUL_CYCLES+ADD_CYCLES-1), IADD_GO => pipelinedGoSignal(MUL_CYCLES+ADD_CYCLES-1), OADD => OINTERP);

--DBG_Prod0 <= multResultAttr10;
--DBG_Prod1 <= multResultAttr20;
--DBG_Add0 <= addResult0;
--DBG_Add1Input <= pipelinedAttr0(MUL_CYCLES+ADD_CYCLES-1);
--DBG_PipelinedGoSig <= pipelinedGoSignal;

PipelinedProcess : process(clk)
begin
	if (rising_edge(clk) ) then
		-- Pipeline our "go signal" simply by moving it down one bit in the shift register:
		pipelinedGoSignal <= pipelinedGoSignal(MUL_CYCLES+ADD_CYCLES-2 downto 0) & IINTERP_GO; -- Shift left by 1

		-- Pipeline our attr0 data by storing an array and shifting down the elements in that array by one each cycle:
		pipelinedAttr0(0) <= IN_Attr0;
		for i in 1 to (MUL_CYCLES+ADD_CYCLES-1) loop
			pipelinedAttr0(i) <= pipelinedAttr0(i - 1);
		end loop;
	end if;
end process PipelinedProcess;

end Behavioral;
