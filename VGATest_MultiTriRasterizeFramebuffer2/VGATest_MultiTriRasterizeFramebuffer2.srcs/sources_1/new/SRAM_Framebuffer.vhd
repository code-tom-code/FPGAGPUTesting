----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2019 08:51:40 PM
-- Design Name: 
-- Module Name: SRAM_Framebuffer - Behavioral
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

entity SRAM_Framebuffer is
  Port (clk : in STD_LOGIC;
        inWriteX : in STD_LOGIC_VECTOR(9 downto 0);
        inWriteY : in STD_LOGIC_VECTOR(9 downto 0);
        inWriteColorR : in STD_LOGIC_VECTOR(7 downto 0);
        inWriteColorG : in STD_LOGIC_VECTOR(7 downto 0);
        inWriteColorB : in STD_LOGIC_VECTOR(7 downto 0);
        inReadEnable : in STD_LOGIC;
        inWriteEnable : in STD_LOGIC;
        inReadX : in STD_LOGIC_VECTOR(9 downto 0);
        inReadY : in STD_LOGIC_VECTOR(9 downto 0);
        outReadColorR : out STD_LOGIC_VECTOR(7 downto 0);
        outReadColorG : out STD_LOGIC_VECTOR(7 downto 0);
        outReadColorB : out STD_LOGIC_VECTOR(7 downto 0) );
end SRAM_Framebuffer;

architecture Behavioral of SRAM_Framebuffer is

type ram_bits_t is array( ( (1024 * 512) - 1) downto 0) of STD_LOGIC_VECTOR(23 downto 0);
signal ram : ram_bits_t := (others => (others => '0') );
attribute RAM_STYLE : string;
attribute RAM_STYLE of ram: signal is "BLOCK";

type REGISTERED_WRITE is record
    readEnable : STD_LOGIC;
    writeEnable : STD_LOGIC;
    colorR : STD_LOGIC_VECTOR(7 downto 0);
    colorG : STD_LOGIC_VECTOR(7 downto 0);
    colorB : STD_LOGIC_VECTOR(7 downto 0);
    writeLocX : unsigned(9 downto 0);    
    writeLocY : unsigned(8 downto 0);
    readLocX : unsigned(9 downto 0);    
    readLocY : unsigned(8 downto 0);
end record REGISTERED_WRITE;

signal lastCycleWrite : REGISTERED_WRITE;
signal lastCycleReadR : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal lastCycleReadG : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal lastCycleReadB : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal lastCycleReadRGB : STD_LOGIC_VECTOR(23 downto 0) := "000000000000000000000000";

begin

    process(clk)
        variable tempConcat : STD_LOGIC_VECTOR(19 downto 0) := "00000000000000000000";
        variable tempWriteRow : STD_LOGIC_VECTOR(23 downto 0) := "000000000000000000000000";
    begin
        if (rising_edge(clk) ) then
            if (lastCycleWrite.readEnable = '1') then -- Reads take priority over writes
                lastCycleReadRGB <= ram(to_integer(unsigned(inReadY) & unsigned(inReadX) ) );
            elsif (lastCycleWrite.writeEnable = '1') then
                tempWriteRow := lastCycleWrite.colorB & lastCycleWrite.colorG & lastCycleWrite.colorR;
                ram(to_integer(lastCycleWrite.writeLocY & lastCycleWrite.writeLocX) ) <= tempWriteRow;    
            end if;
            
            lastCycleWrite.readEnable <= inReadEnable;
            lastCycleWrite.writeEnable <= inWriteEnable;
            lastCycleWrite.colorR <= inWriteColorR;
            lastCycleWrite.colorG <= inWriteColorG;
            lastCycleWrite.colorB <= inWriteColorB;
            lastCycleWrite.writeLocX <= unsigned(inWriteX);
            lastCycleWrite.writeLocY <= unsigned(inWriteY(8 downto 0) );
            lastCycleWrite.readLocX <= unsigned(inReadX);
            lastCycleWrite.readLocY <= unsigned(inReadY(8 downto 0) );
            
            outReadColorR <= lastCycleReadRGB(7 downto 0);
            outReadColorG <= lastCycleReadRGB(15 downto 8);
            outReadColorB <= lastCycleReadRGB(23 downto 16);
        end if;
    end process;

end Behavioral;
