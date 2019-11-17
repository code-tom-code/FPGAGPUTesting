----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2019 09:15:10 PM
-- Design Name: 
-- Module Name: R8G8B8_to_R5G5B4 - Behavioral
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

entity R8G8B8_to_R5G5B4 is
    Port (  red8 : in STD_LOGIC_VECTOR(7 downto 0);
           green8 : in STD_LOGIC_VECTOR(7 downto 0);
           blue8 : in STD_LOGIC_VECTOR(7 downto 0);
           outRed5 : out STD_LOGIC_VECTOR(4 downto 0);
           outGreen5 : out STD_LOGIC_VECTOR(4 downto 0);
           outBlue4 : out STD_LOGIC_VECTOR(3 downto 0) );
end R8G8B8_to_R5G5B4;

architecture Behavioral of R8G8B8_to_R5G5B4 is

begin

    outRed5 <= red8(7 downto 3);
    outGreen5 <= green8(7 downto 3);
    outBlue4 <= blue8(7 downto 4);

end Behavioral;
