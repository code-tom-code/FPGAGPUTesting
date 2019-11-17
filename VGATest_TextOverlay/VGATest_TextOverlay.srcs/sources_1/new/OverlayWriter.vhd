----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2019 09:07:05 PM
-- Design Name: 
-- Module Name: OverlayWriter - Behavioral
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

entity OverlayWriter is
  Port (clk : in STD_LOGIC;
        frameNumber : in STD_LOGIC_VECTOR(7 downto 0);
        outWriteEnable : out STD_LOGIC;
        outWriteCharX : out STD_LOGIC_VECTOR(6 downto 0);
        outWriteCharY : out STD_LOGIC_VECTOR(5 downto 0);
        outWriteCharASCII : out STD_LOGIC_VECTOR(7 downto 0);
        outWriteForegroundColor : out STD_LOGIC_VECTOR(3 downto 0);
        outWriteBackgroundColor : out STD_LOGIC_VECTOR(3 downto 0) );
end OverlayWriter;

architecture Behavioral of OverlayWriter is

type hex_ASCII_entry is array(15 downto 0) of std_logic_vector(7 downto 0);
constant hex_ASCII_lookup : hex_ASCII_entry := (
0 => X"30",
1 => X"31",
2 => X"32",
3 => X"33",
4 => X"34",
5 => X"35",
6 => X"36",
7 => X"37",
8 => X"38",
9 => X"39",
10 => X"41",
11 => X"42",
12 => X"43",
13 => X"44",
14 => X"45",
15 => X"46");

signal setupMatrixX : unsigned(3 downto 0) := (others => '0');
signal setupMatrixY : unsigned(3 downto 0) := (others => '0');
signal matrixCompleted : STD_LOGIC := '0';
signal rowSetup : unsigned(5 downto 0) := (others => '0');
signal colSetup : STD_LOGIC := '0';

begin

    process(clk)
        variable setupState : unsigned(3 downto 0) := X"0";
        variable setupRow : unsigned(5 downto 0) := to_unsigned(0, 6);
    begin
        if (rising_edge(clk) ) then
            if (setupState = X"0") then
                if (matrixCompleted = '0') then
                    outWriteCharX <= std_logic_vector(resize(unsigned(setupMatrixX), outWriteCharX'length - 1) + 6) & '0';
                    outWriteCharY <= std_logic_vector(resize(unsigned(setupMatrixY), outWriteCharY'length - 1) + 6) & '0';
                    outWriteCharASCII <= std_logic_vector(setupMatrixY) & std_logic_vector(setupMatrixX);
                    outWriteForegroundColor <= "1111";
                    outWriteBackgroundColor <= "0011";
                    
                    setupMatrixX <= setupMatrixX + 1;
                    if (setupMatrixX = X"F") then
                        setupMatrixY <= setupMatrixY + 1;
                        
                        if (setupMatrixY = X"F") then
                            matrixCompleted <= '1';
                        end if;
                    else
                        setupMatrixY <= setupMatrixY;
                    end if;
                else
                    outWriteCharY <= std_logic_vector(rowSetup);
                    if (colSetup = '0') then
                        outWriteCharASCII <= hex_ASCII_lookup(to_integer(unsigned(rowSetup(5 downto 4) ) ) );
                        outWriteCharX <= "0000000";
                        colSetup <= '1';
                    else
                        outWriteCharASCII <= hex_ASCII_lookup(to_integer(unsigned(rowSetup(3 downto 0) ) ) );  
                        outWriteCharX <= "0000001";
                        colSetup <= '0';
                        rowSetup <= rowSetup + 1;
                    end if;
                    outWriteForegroundColor <= "0001";
                    outWriteBackgroundColor <= "1111";
                    if (rowSetup = 59) then
                        setupState := X"1";
                    end if; 
                end if;
            end if;
            
            case setupState is
                when X"0" =>
                when X"1" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(10, outWriteCharX'length) );
                    outWriteCharASCII <= X"48"; -- H
                    outWriteForegroundColor <= "1111";
                when X"2" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(11, outWriteCharX'length) );
                    outWriteCharASCII <= X"65"; -- e
                    outWriteForegroundColor <= "1111";
                when X"3" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(12, outWriteCharX'length) );
                    outWriteCharASCII <= X"6C"; -- l
                    outWriteForegroundColor <= "1001";
                when X"4" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(13, outWriteCharX'length) );
                    outWriteCharASCII <= X"6C"; -- l
                    outWriteForegroundColor <= "0101";
                when X"5" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(14, outWriteCharX'length) );
                    outWriteCharASCII <= X"6F"; -- o
                    outWriteForegroundColor <= "0011";
                when X"6" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(15, outWriteCharX'length) );
                    outWriteCharASCII <= X"20"; -- space
                    outWriteForegroundColor <= "1111";
                when X"7" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(16, outWriteCharX'length) );
                    outWriteCharASCII <= X"57"; -- W
                    outWriteForegroundColor <= "1111";
                when X"8" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(17, outWriteCharX'length) );
                    outWriteCharASCII <= X"6F"; -- o
                    outWriteForegroundColor <= "1111";
                when X"9" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(18, outWriteCharX'length) );
                    outWriteCharASCII <= X"72"; -- r
                    outWriteForegroundColor <= "1111";
                when X"A" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(19, outWriteCharX'length) );
                    outWriteCharASCII <= X"6C"; -- l
                    outWriteForegroundColor <= "1111";
                when X"B" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(20, outWriteCharX'length) );
                    outWriteCharASCII <= X"64"; -- d
                    outWriteForegroundColor <= "1111";
                when X"C" =>
                    outWriteCharX <= std_logic_vector(to_unsigned(21, outWriteCharX'length) );
                    outWriteCharASCII <= X"2E"; -- .
                    outWriteForegroundColor <= "1111";
                when others =>
                    outWriteCharX <= std_logic_vector(to_unsigned(75, outWriteCharX'length) );
                    outWriteCharY <= std_logic_vector(to_unsigned(8, outWriteCharY'length) );
                    outWriteCharASCII <= frameNumber;
                    outWriteForegroundColor <= "1111";
                    outWriteBackgroundColor <= "1001";
            end case;
            
            outWriteEnable <= '1';
            
            if (setupState < X"D" and setupState > X"0") then
                setupState := setupState + 1;
                outWriteCharY <= std_logic_vector(to_unsigned(10, outWriteCharY'length) );
                outWriteBackgroundColor <= "0000";
            end if;
        end if;
    end process;

end Behavioral;
