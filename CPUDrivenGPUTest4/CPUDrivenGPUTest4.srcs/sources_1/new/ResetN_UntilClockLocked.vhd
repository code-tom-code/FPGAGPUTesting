library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ResetN_UntilClockLocked is
    Port ( inResetp : in STD_LOGIC;
           locked : in STD_LOGIC;
           outResetn : out STD_LOGIC);
end ResetN_UntilClockLocked;

architecture Behavioral of ResetN_UntilClockLocked is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of inResetp: SIGNAL is "xilinx.com:signal:reset:1.0 inResetp RST";
ATTRIBUTE X_INTERFACE_INFO of outResetn: SIGNAL is "xilinx.com:signal:reset:1.0 outResetn RST";

-- Supported parameter: POLARITY {ACTIVE_LOW, ACTIVE_HIGH}
-- Normally active low is assumed.  Use this parameter to force the level
ATTRIBUTE X_INTERFACE_PARAMETER of inResetp: SIGNAL is "POLARITY ACTIVE_HIGH";
ATTRIBUTE X_INTERFACE_PARAMETER of outResetn: SIGNAL is "POLARITY ACTIVE_LOW";

begin

outResetn <= not inResetp;

end Behavioral;
