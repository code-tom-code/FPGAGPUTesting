----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2019 09:19:22 PM
-- Design Name: 
-- Module Name: WriteArbiter - Behavioral
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

entity WriteArbiter is
    Port ( clk : in STD_LOGIC;
           outWriteLocX : out STD_LOGIC_VECTOR(9 downto 0);
           outWriteLocY : out STD_LOGIC_VECTOR(9 downto 0);
           outWriteColorR : out STD_LOGIC_VECTOR(7 downto 0);
           outWriteColorG : out STD_LOGIC_VECTOR(7 downto 0);
           outWriteColorB : out STD_LOGIC_VECTOR(7 downto 0);
           outWriteEnable : out STD_LOGIC;
           
           inWriteLocX0 : in STD_LOGIC_VECTOR(9 downto 0);
           inWriteLocY0 : in STD_LOGIC_VECTOR(9 downto 0);
           inWriteColorR0 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteColorG0 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteColorB0 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteIsValid0 : in STD_LOGIC;
           outWriteAck0 : out STD_LOGIC;
           
           inWriteLocX1 : in STD_LOGIC_VECTOR(9 downto 0);
           inWriteLocY1 : in STD_LOGIC_VECTOR(9 downto 0);
           inWriteColorR1 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteColorG1 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteColorB1 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteIsValid1 : in STD_LOGIC;
           outWriteAck1 : out STD_LOGIC;
           
           inWriteLocX2 : in STD_LOGIC_VECTOR(9 downto 0);
           inWriteLocY2 : in STD_LOGIC_VECTOR(9 downto 0);
           inWriteColorR2 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteColorG2 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteColorB2 : in STD_LOGIC_VECTOR(7 downto 0);
           inWriteIsValid2 : in STD_LOGIC;
           outWriteAck2 : out STD_LOGIC);
end WriteArbiter;

architecture Behavioral of WriteArbiter is

begin

process(clk)
begin
    if (rising_edge(clk) ) then
        if (inWriteIsValid0 = '1') then
            outWriteEnable <= '1';
            outWriteLocX <= inWriteLocX0;
            outWriteLocY <= inWriteLocY0;
            outWriteColorR <= inWriteColorR0;
            outWriteColorG <= inWriteColorG0;
            outWriteColorB <= inWriteColorB0;
            outWriteAck0 <= '1';
            outWriteAck1 <= '0';
            outWriteAck2 <= '0';
        elsif (inWriteIsValid1 = '1') then
            outWriteEnable <= '1';
            outWriteLocX <= inWriteLocX1;
            outWriteLocY <= inWriteLocY1;
            outWriteColorR <= inWriteColorR1;
            outWriteColorG <= inWriteColorG1;
            outWriteColorB <= inWriteColorB1;
            outWriteAck0 <= '0';
            outWriteAck1 <= '1';
            outWriteAck2 <= '0';
        elsif (inWriteIsValid2 = '1') then
            outWriteEnable <= '1';
            outWriteLocX <= inWriteLocX2;
            outWriteLocY <= inWriteLocY2;
            outWriteColorR <= inWriteColorR2;
            outWriteColorG <= inWriteColorG2;
            outWriteColorB <= inWriteColorB2;
            outWriteAck0 <= '0';
            outWriteAck1 <= '0';
            outWriteAck2 <= '1';
        else
            outWriteEnable <= '0';
            outWriteAck0 <= '0';
            outWriteAck1 <= '0';
            outWriteAck2 <= '0';
        end if;
    end if;
end process;

end Behavioral;
