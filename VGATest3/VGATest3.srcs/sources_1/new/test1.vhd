----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2018 11:47:30 PM
-- Design Name: 
-- Module Name: test1 - Behavioral
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

entity test1 is
    Port ( clk : in STD_LOGIC;
           vsync : out STD_LOGIC;
           hsync : out STD_LOGIC;
           port_r : out STD_LOGIC;
           port_g : out STD_LOGIC;
           port_b : out STD_LOGIC);
end test1;

architecture Behavioral of test1 is

signal lineNumber : STD_LOGIC_VECTOR(9 downto 0) := "0000000000"; -- stores values from 0 to 1024, but we only need from 0 to 525
signal pixelNumber : STD_LOGIC_VECTOR(9 downto 0) := "0000000000"; -- stores values from 0 to 1024, but we only need from 0 to 800


begin

    process (clk)
    begin
        if (rising_edge(clk) ) then
            if (unsigned(lineNumber) < 33) then
                vsync <= '0';
            elsif (unsigned(lineNumber) > 513) then
                hsync <= '1';
                vsync <= '1';
            else
                if (unsigned(pixelNumber) < 704) then
                    hsync <= '1';
                else
                    hsync <= '0';
                end if;                                
            end if;
            
            if (unsigned(lineNumber) > 33 and unsigned(lineNumber) < 513 and
                unsigned(pixelNumber) > 48 and unsigned(pixelNumber) < 688) then
                port_r <= '1';
                port_g <= '1';
                port_b <= '1';
            else
                port_r <= '0';
                port_g <= '0';
                port_b <= '0';
            end if;
            
            if (lineNumber = "1100011111") then -- 799 = 0x31F
                lineNumber <= "0000000000";
                pixelNumber <= "0000000000";
            else
                if (pixelNumber = "1000001100") then -- 524 = 0x20C
                    pixelNumber <= "0000000000";
                    lineNumber <= std_logic_vector(unsigned(lineNumber) + 1);
                else
                    pixelNumber <= std_logic_vector(unsigned(pixelNumber) + 1);
                    lineNumber <= lineNumber;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
