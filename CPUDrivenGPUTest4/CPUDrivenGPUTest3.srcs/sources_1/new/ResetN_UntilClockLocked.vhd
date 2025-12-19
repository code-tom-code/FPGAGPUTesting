----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2019 12:08:49 PM
-- Design Name: 
-- Module Name: ResetN_UntilClockLocked - Behavioral
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

entity ResetN_UntilClockLocked is
    Port ( reset : in STD_LOGIC;
           locked : in STD_LOGIC;
           resetn : out STD_LOGIC);
end ResetN_UntilClockLocked;

architecture Behavioral of ResetN_UntilClockLocked is

begin

resetn <= not reset;

end Behavioral;
