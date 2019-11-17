----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2019 08:46:21 PM
-- Design Name: 
-- Module Name: ScanOut - Behavioral
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

entity ScanOut is
  Port (clk : in STD_LOGIC;
        vsync : out STD_LOGIC;
        hsync : out STD_LOGIC;
        outXCoord : out STD_LOGIC_VECTOR(9 downto 0); -- 0 to 639
        outYCoord : out STD_LOGIC_VECTOR(9 downto 0); -- 0 to 479
        outFrameNumber : out STD_LOGIC_VECTOR(7 downto 0); -- 0 to 1023
        outIsValidPixel : out STD_LOGIC);
end ScanOut;

architecture Behavioral of ScanOut is

signal lineNumber : STD_LOGIC_VECTOR(9 downto 0) := "0000000000"; -- stores values from 0 to 1024, but we only need from 0 to 525
signal pixelNumber : STD_LOGIC_VECTOR(9 downto 0) := "0000000000"; -- stores values from 0 to 1024, but we only need from 0 to 800
signal frameNumber : STD_LOGIC_VECTOR(7 downto 0) := "00000000";

begin

    process(clk)
    begin
        if (rising_edge(clk) ) then
            outFrameNumber <= frameNumber;
            
            if (unsigned(lineNumber) < 33) then
                if (unsigned(lineNumber) < 2) then
                    vsync <= '0';
                else
                    vsync <= '1';
                end if;
            elsif (unsigned(lineNumber) > 513) then
                vsync <= '1';
            else
                if (unsigned(pixelNumber) < 704) then
                    hsync <= '1';
                else
                    hsync <= '0';
                end if;      
                vsync <= '1';                          
            end if;
            
            if (unsigned(lineNumber) > 33 and unsigned(lineNumber) < 513 and unsigned(pixelNumber) > 48 and unsigned(pixelNumber) < 688) then
                outXCoord <= std_logic_vector(unsigned(pixelNumber) - 48);
                outYCoord <= std_logic_vector(unsigned(lineNumber) - 33);
                outIsValidPixel <= '1';
            else
                outXCoord <= (others => '0');
                outYCoord <= (others => '0');
                outIsValidPixel <= '0';
            end if;
            
            if (lineNumber = "1000001100") then -- 524 = 0x20C
                lineNumber <= "0000000000";
                pixelNumber <= "0000000000";
                frameNumber <= std_logic_vector(unsigned(frameNumber) + 1);
            else
                if (pixelNumber = "1100011111") then -- 799 = 0x31F
                    pixelNumber <= "0000000000";
                    lineNumber <= std_logic_vector(unsigned(lineNumber) + 1);
                else
                    pixelNumber <= std_logic_vector(unsigned(pixelNumber) + 1);
                    lineNumber <= lineNumber;
                end if;
                frameNumber <= frameNumber;
            end if;
        end if;
    end process;

end Behavioral;
