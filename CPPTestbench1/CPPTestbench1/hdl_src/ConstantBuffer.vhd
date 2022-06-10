
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity ConstantBuffer is
    Port (clk : in STD_LOGIC;

		enable : in STD_LOGIC;
		writeMode : in STD_LOGIC; -- 0 for read, 1 for write

		regIndex : in STD_LOGIC_VECTOR(7 downto 0); -- 8 bit uint to address 256 constant registers
		regComponent : in STD_LOGIC_VECTOR(1 downto 0); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel

		readOutData : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		writeInData : in STD_LOGIC_VECTOR(31 downto 0);

	-- BRAM interface begin
		ConstBufferBRAM_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		ConstBufferBRAM_clka : out STD_LOGIC := '0';
		ConstBufferBRAM_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ConstBufferBRAM_douta : in STD_LOGIC_VECTOR(31 downto 0);
		ConstBufferBRAM_ena : out STD_LOGIC := '0';
		ConstBufferBRAM_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0')
	-- BRAM interface end
		);
end ConstantBuffer;

architecture Behavioral of ConstantBuffer is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of ConstBufferBRAM_ena: SIGNAL is "xilinx.com:interface:bram:1.0 ConstBufferBRAM EN";
ATTRIBUTE X_INTERFACE_INFO of ConstBufferBRAM_clka: SIGNAL is "xilinx.com:interface:bram:1.0 ConstBufferBRAM CLK";
ATTRIBUTE X_INTERFACE_INFO of ConstBufferBRAM_douta: SIGNAL is "xilinx.com:interface:bram:1.0 ConstBufferBRAM DOUT";
ATTRIBUTE X_INTERFACE_INFO of ConstBufferBRAM_dina: SIGNAL is "xilinx.com:interface:bram:1.0 ConstBufferBRAM DIN";
ATTRIBUTE X_INTERFACE_INFO of ConstBufferBRAM_wea: SIGNAL is "xilinx.com:interface:bram:1.0 ConstBufferBRAM WE";
ATTRIBUTE X_INTERFACE_INFO of ConstBufferBRAM_addra: SIGNAL is "xilinx.com:interface:bram:1.0 ConstBufferBRAM ADDR";

begin

ConstBufferBRAM_dina <= writeInData;
ConstBufferBRAM_clka <= clk;
readOutData <= ConstBufferBRAM_douta;
ConstBufferBRAM_ena <= enable;
ConstBufferBRAM_wea <= "0" when writeMode = '0' else "1";
ConstBufferBRAM_addra <= regIndex & regComponent;

end Behavioral;
