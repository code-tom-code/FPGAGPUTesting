----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2019 04:33:23 PM
-- Design Name: 
-- Module Name: TexSampleFIFO - Behavioral
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

entity TexSampleFIFO is
    generic ( FIFO_DEPTH : natural := 16 );
    Port ( clk : in STD_LOGIC;
           writeEnable : in STD_LOGIC;
           readEnable : in STD_LOGIC;
           inBarycentricA : in STD_LOGIC_VECTOR(15 downto 0);
           inBarycentricB : in STD_LOGIC_VECTOR(15 downto 0);
           inBarycentricC : in STD_LOGIC_VECTOR(15 downto 0);
           inPixelX : in STD_LOGIC_VECTOR(9 downto 0);
           inPixelY : in STD_LOGIC_VECTOR(9 downto 0);
           isFIFOFull : out STD_LOGIC;
           isFIFOEmpty : out STD_LOGIC;
           outBarycentricA : out STD_LOGIC_VECTOR(15 downto 0);
           outBarycentricB : out STD_LOGIC_VECTOR(15 downto 0);
           outBarycentricC : out STD_LOGIC_VECTOR(15 downto 0);
           outPixelX : out STD_LOGIC_VECTOR(9 downto 0);
           outPixelY : out STD_LOGIC_VECTOR(9 downto 0) );
end TexSampleFIFO;

architecture Behavioral of TexSampleFIFO is

function clogb2( depth : natural) return integer is
variable temp    : integer := depth;
variable ret_val : integer := 0;
begin
    while temp > 1 loop
        ret_val := ret_val + 1;
        temp    := temp / 2;
    end loop;
    return ret_val;
end function;

type TexSampleFIFOItem is record
    barycentricA : STD_LOGIC_VECTOR(15 downto 0);
    barycentricB : STD_LOGIC_VECTOR(15 downto 0);
    barycentricC : STD_LOGIC_VECTOR(15 downto 0);
    pixelX : STD_LOGIC_VECTOR(9 downto 0);
    pixelY : STD_LOGIC_VECTOR(9 downto 0);
end record TexSampleFIFOItem;

type FIFO_RAM_T is array(FIFO_DEPTH - 1 downto 0) of TexSampleFIFOItem;

signal writeIndex : unsigned(clogb2(FIFO_DEPTH) - 1 downto 0) := (others => '0');
signal readIndex : unsigned(clogb2(FIFO_DEPTH) - 1 downto 0) := (others => '0');
signal currentSize : unsigned(clogb2(FIFO_DEPTH) - 1 downto 0) := (others => '0');
signal FIFO_RAM : FIFO_RAM_T;
signal initState : STD_LOGIC := '1';

begin

    process(clk)
        variable tempFIFOItem : TexSampleFIFOItem;
    begin
        if (rising_edge(clk) ) then            
            if (initState = '1') then
                initState <= '0';
                isFIFOEmpty <= '1';
                isFIFOFull <= '0';
                outBarycentricA <= (others => '0');
                outBarycentricB <= (others => '0');
                outBarycentricC <= (others => '0');                                
                outPixelX <= (others => '0');
                outPixelY <= (others => '0');
            end if;
            if (writeEnable = '1') then
                tempFIFOItem.barycentricA := inBarycentricA;
                tempFIFOItem.barycentricB := inBarycentricB;
                tempFIFOItem.barycentricC := inBarycentricC;
                tempFIFOItem.pixelX := inPixelX;
                tempFIFOItem.pixelY := inPixelY;
                
                FIFO_RAM(to_integer(writeIndex) ) <= tempFIFOItem;
                writeIndex <= writeIndex + 1;
            end if;
            
            if (readEnable = '1') then
                tempFIFOItem := FIFO_RAM(to_integer(readIndex) );
                outBarycentricA <= tempFIFOItem.barycentricA;
                outBarycentricB <= tempFIFOItem.barycentricB;
                outBarycentricC <= tempFIFOItem.barycentricC; 
                outPixelX <= tempFIFOItem.pixelX;
                outPixelY <= tempFIFOItem.pixelY;
                
                readIndex <= readIndex + 1;
            end if;
            
            if (writeEnable = '1' and readEnable = '0') then
                currentSize <= currentSize + 1;
                isFIFOEmpty <= '0';
                if (currentSize >= FIFO_DEPTH - 2) then
                    isFIFOFull <= '1';
                end if;
            elsif (writeEnable = '0' and readEnable = '1') then
                currentSize <= currentSize - 1;
                if (currentSize <= 1) then
                    isFIFOEmpty <= '1';
                end if;
                isFIFOFull <= '0';
            else
                currentSize <= currentSize;
            end if;
        end if;
    end process;

end Behavioral;
