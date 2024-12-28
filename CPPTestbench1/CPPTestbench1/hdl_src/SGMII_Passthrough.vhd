library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity SGMII_Passthrough is
	Port (
		tx_p : in STD_LOGIC;
		tx_n : in STD_LOGIC;
		rx_p : out STD_LOGIC := '0';
		rx_n : out STD_LOGIC := '0';

		otx_p : out STD_LOGIC := '0';
		otx_n : out STD_LOGIC := '0';
		orx_p : in STD_LOGIC;
		orx_n : in STD_LOGIC
		);
end SGMII_Passthrough;

architecture Behavioral of SGMII_Passthrough is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of tx_p: SIGNAL is "xilinx.com:interface:sgmii:1.0 SGMII_IN TXP";
ATTRIBUTE X_INTERFACE_INFO of tx_n: SIGNAL is "xilinx.com:interface:sgmii:1.0 SGMII_IN TXN";
ATTRIBUTE X_INTERFACE_INFO of rx_p: SIGNAL is "xilinx.com:interface:sgmii:1.0 SGMII_IN RXP";
ATTRIBUTE X_INTERFACE_INFO of rx_n: SIGNAL is "xilinx.com:interface:sgmii:1.0 SGMII_IN RXN";

ATTRIBUTE X_INTERFACE_INFO of otx_p: SIGNAL is "xilinx.com:interface:sgmii:1.0 SGMII_OUT TXP";
ATTRIBUTE X_INTERFACE_INFO of otx_n: SIGNAL is "xilinx.com:interface:sgmii:1.0 SGMII_OUT TXN";
ATTRIBUTE X_INTERFACE_INFO of orx_p: SIGNAL is "xilinx.com:interface:sgmii:1.0 SGMII_OUT RXP";
ATTRIBUTE X_INTERFACE_INFO of orx_n: SIGNAL is "xilinx.com:interface:sgmii:1.0 SGMII_OUT RXN";

begin

otx_p <= tx_p;
otx_n <= tx_n;
rx_p <= orx_p;
rx_n <= orx_n;

end Behavioral;
