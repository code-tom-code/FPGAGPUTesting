----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2019 08:54:57 PM
-- Design Name: 
-- Module Name: AlphaBlend - Behavioral
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

entity AlphaBlend is
  Port (clk : in STD_LOGIC;
        inBG_RGB : in STD_LOGIC_VECTOR(2 downto 0);
        inFG_RGB : in STD_LOGIC_VECTOR(2 downto 0);
        inFGAlpha : in STD_LOGIC;
        port_r : out STD_LOGIC;
        port_g : out STD_LOGIC;
        port_b : out STD_LOGIC);
end AlphaBlend;

architecture Behavioral of AlphaBlend is

begin

    process(clk)
    begin
        if (rising_edge(clk) ) then
            if (inFGAlpha = '1') then
                port_r <= inFG_RGB(2);
                port_g <= inFG_RGB(1);
                port_b <= inFG_RGB(0); 
            else
                port_r <= inBG_RGB(2);
                port_g <= inBG_RGB(1);
                port_b <= inBG_RGB(0);
            end if;
        end if;
    end process;


end Behavioral;
