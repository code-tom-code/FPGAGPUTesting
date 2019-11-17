----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2019 10:07:59 PM
-- Design Name: 
-- Module Name: ImageROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ColorTest is
  Port (clk : in STD_LOGIC;
        xPos : in STD_LOGIC_VECTOR(9 downto 0); -- 0 to 639
        yPos : in STD_LOGIC_VECTOR(9 downto 0); -- 0 to 479
        isValidPixel : in STD_LOGIC;
        outColorR : out STD_LOGIC_VECTOR(7 downto 0);
        outColorG : out STD_LOGIC_VECTOR(7 downto 0);
        outColorB : out STD_LOGIC_VECTOR(7 downto 0) );
end ColorTest;

architecture Behavioral of ColorTest is

begin

    process(clk)
    begin
        if (rising_edge(clk) ) then
            if (isValidPixel = '1') then
                outColorR <= xPos(7 downto 0);
                outColorG <= yPos(7 downto 0);
                outColorB <= xPos(7 downto 0) and yPos(7 downto 0);
            else
                outColorR <= "00000000";
                outColorG <= "00000000";
                outColorB <= "00000000";
            end if;
        end if;
    end process;

end Behavioral;
