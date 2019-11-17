----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2019 08:03:48 PM
-- Design Name: 
-- Module Name: ClearBlock - Behavioral
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

entity ClearBlock is
    Port ( clk : in STD_LOGIC;
           clearLeft : in STD_LOGIC_VECTOR(9 downto 0);
           clearRight : in STD_LOGIC_VECTOR(9 downto 0);
           clearTop : in STD_LOGIC_VECTOR(9 downto 0);
           clearBottom : in STD_LOGIC_VECTOR(9 downto 0);
           inClearColorR : in STD_LOGIC_VECTOR(7 downto 0);
           inClearColorG : in STD_LOGIC_VECTOR(7 downto 0);
           inClearColorB : in STD_LOGIC_VECTOR(7 downto 0);
           outPixelX : out STD_LOGIC_VECTOR(9 downto 0);
           outPixelY : out STD_LOGIC_VECTOR(9 downto 0);
           outClearColorR : out STD_LOGIC_VECTOR(7 downto 0);
           outClearColorG : out STD_LOGIC_VECTOR(7 downto 0);
           outClearColorB : out STD_LOGIC_VECTOR(7 downto 0);
           outWriteIsValid : out STD_LOGIC;
           inWriteAck : in STD_LOGIC;
           clearRequestBegin : in STD_LOGIC;
           clearComplete : out STD_LOGIC);
end ClearBlock;

architecture Behavioral of ClearBlock is

type clearState is 
(
    waitingForStartSignal,
    clearing,
    waitingForWrite
);

signal currentState : clearState := waitingForStartSignal;
signal rectLeft : unsigned(9 downto 0) := (others => '0');
signal rectRight : unsigned(9 downto 0) := (others => '0');
signal rectTop : unsigned(9 downto 0) := (others => '0');
signal rectBottom : unsigned(9 downto 0) := (others => '0');
signal clearColorR : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal clearColorG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal clearColorB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal currentClearX : unsigned(9 downto 0) := (others => '0');
signal currentClearY : unsigned(9 downto 0) := (others => '0');

begin

    process(clk)
    begin
        if (rising_edge(clk) ) then
            case currentState is
                when waitingForStartSignal =>
                    outWriteIsValid <= '0';
                    outPixelX <= (others => '0');
                    outPixelY <= (others => '0');
                    outClearColorR <= (others => '0');
                    outClearColorG <= (others => '0');
                    outClearColorB <= (others => '0');
                    
                    if (clearRequestBegin = '1') then
                        rectLeft <= unsigned(clearLeft);
                        rectRight <= unsigned(clearRight);
                        rectTop <= unsigned(clearTop);
                        rectBottom <= unsigned(clearBottom);
                        clearColorR <= inClearColorR;
                        clearColorG <= inClearColorG;
                        clearColorB <= inClearColorB;
                        currentClearX <= unsigned(rectLeft);
                        currentClearY <= unsigned(rectTop);
                        clearComplete <= '0';
                        currentState <= clearing;
                    else
                        clearComplete <= '1';                        
                    end if;
                when clearing =>
                    outPixelX <= std_logic_vector(currentClearX);
                    outPixelY <= std_logic_vector(currentClearY);
                    outClearColorR <= clearColorR;
                    outClearColorG <= clearColorG;
                    outClearColorB <= clearColorB;
                    outWriteIsValid <= '1';
                    currentState <= waitingForWrite;
                    
                when waitingForWrite =>
                    if (inWriteAck = '1') then
                        outWriteIsValid <= '0';
                        
                        if (currentClearY >= rectBottom) then
                            currentState <= waitingForStartSignal;
                            clearComplete <= '1';
                        else
                            if (currentClearX >= rectRight) then
                                currentClearX <= rectLeft;
                                currentClearY <= currentClearY + 1;
                            else
                                currentClearX <= currentClearX + 1;
                            end if;
                            currentState <= clearing;
                            clearComplete <= '0';
                        end if;
                    end if;
            end case;
        end if;
    end process;

end Behavioral;
