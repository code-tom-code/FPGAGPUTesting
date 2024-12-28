----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2019 12:08:49 PM
-- Design Name: 
-- Module Name: DifferentialClockSplitter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DifferentialClockSplitter is
    Port ( clk_p : in STD_LOGIC;
           clk_n : in STD_LOGIC;
           
		   clone1_clk_p : out STD_LOGIC;
		   clone1_clk_n : out STD_LOGIC;
		   
		   clone2_clk_p : out STD_LOGIC;
		   clone2_clk_n : out STD_LOGIC;
		   
		   clone3_clk : out STD_LOGIC;
		   
		   rst : in STD_LOGIC);
end DifferentialClockSplitter;

architecture Behavioral of DifferentialClockSplitter is

attribute X_INTERFACE_INFO      : string;
attribute X_INTERFACE_PARAMETER : string;

attribute X_INTERFACE_INFO      of clk_p: signal is "xilinx.com:interface:diff_clock:1.0 diff_clk_in CLK_P";
attribute X_INTERFACE_INFO      of clk_n: signal is "xilinx.com:interface:diff_clock:1.0 diff_clk_in CLK_N";

attribute X_INTERFACE_INFO      of clone1_clk_p: signal is "xilinx.com:interface:diff_clock:1.0 diff_clk_out1 CLK_P";
attribute X_INTERFACE_INFO      of clone1_clk_n: signal is "xilinx.com:interface:diff_clock:1.0 diff_clk_out1 CLK_N";

attribute X_INTERFACE_INFO      of clone2_clk_p: signal is "xilinx.com:interface:diff_clock:1.0 diff_clk_out2 CLK_P";
attribute X_INTERFACE_INFO      of clone2_clk_n: signal is "xilinx.com:interface:diff_clock:1.0 diff_clk_out2 CLK_N";

attribute X_INTERFACE_INFO      of clone3_clk: signal is "xilinx.com:signal:clock:1.0 solo_clk CLK";

attribute X_INTERFACE_INFO      of rst: signal is "xilinx.com:signal:reset:1.0 rst RST";

attribute X_INTERFACE_PARAMETER of clk_p: signal is "FREQ_HZ 300000000, CLK_DOMAIN /default_sysclk1_300, PHASE 0.0, ASSOCIATED_RESET RST";

attribute X_INTERFACE_PARAMETER of clk_n: signal is "FREQ_HZ 300000000, CLK_DOMAIN /default_sysclk1_300, PHASE 0.0, ASSOCIATED_RESET RST";

attribute X_INTERFACE_PARAMETER of clone1_clk_p: signal is "FREQ_HZ 300000000, CLK_DOMAIN /default_sysclk1_300, PHASE 0.0, ASSOCIATED_RESET RST";

attribute X_INTERFACE_PARAMETER of clone1_clk_n: signal is "FREQ_HZ 300000000, CLK_DOMAIN /default_sysclk1_300, PHASE 0.0, ASSOCIATED_RESET RST";

attribute X_INTERFACE_PARAMETER of clone2_clk_p: signal is "FREQ_HZ 300000000, CLK_DOMAIN /default_sysclk1_300, PHASE 0.0, ASSOCIATED_RESET RST";

attribute X_INTERFACE_PARAMETER of clone2_clk_n: signal is "FREQ_HZ 300000000, CLK_DOMAIN /default_sysclk1_300, PHASE 0.0, ASSOCIATED_RESET RST";

attribute X_INTERFACE_PARAMETER of clone3_clk: signal is "FREQ_HZ 300000000, CLK_DOMAIN /default_sysclk1_300, PHASE 0.0, ASSOCIATED_RESET RST";

attribute X_INTERFACE_PARAMETER of rst: signal is "POLARITY ACTIVE_HIGH";

begin

clone1_clk_p <= clk_p;
clone1_clk_n <= clk_n;

clone2_clk_p <= clk_p;
clone2_clk_n <= clk_n;

clone3_clk <= clk_p;

end Behavioral;
