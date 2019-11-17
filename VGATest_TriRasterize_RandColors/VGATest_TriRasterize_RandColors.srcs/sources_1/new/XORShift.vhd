library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity XORShift is
    Port ( clk : in STD_LOGIC;
           frameCounter : in STD_LOGIC_VECTOR(9 downto 0);
           keyColor : out STD_LOGIC_VECTOR(2 downto 0) );
end XORShift;

architecture Behavioral of XORShift is

signal seedState : STD_LOGIC_VECTOR(31 downto 0) := "01010101010101010101010101010101";
signal lastFrameNum : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

begin

    process(clk)
        variable x0 : BIT_VECTOR(31 downto 0) := (others => '0');
        variable x1 : BIT_VECTOR(31 downto 0) := (others => '0');
        variable x2 : BIT_VECTOR(31 downto 0) := (others => '0');
        variable x3 : BIT_VECTOR(31 downto 0) := (others => '0');
        variable x4 : BIT_VECTOR(31 downto 0) := (others => '0');
        variable x5 : BIT_VECTOR(31 downto 0) := (others => '0');
        variable x6 : BIT_VECTOR(31 downto 0) := (others => '0');
    begin
        if (rising_edge(clk) ) then
            keyColor <= seedState(2 downto 0);
            
            if (lastFrameNum = frameCounter) then
            else
                lastFrameNum <= frameCounter;
                
                if (frameCounter(4 downto 0) = "00000") then
                    x0 := to_bitvector(seedState); -- start with the seed state
                                    
                    x1 := x0 sll 13; -- x ^= x << 13;
                    x2 := x1 xor x0;
                    
                    x3 := x2 srl 17; -- x ^= x >> 17;
                    x4 := x3 xor x2;
                    
                    x5 := x4 sll 5; -- x ^= x << 5;
                    x6 := x5 xor x4;
                    
                    seedState <= To_StdLogicVector(x6);
                end if;
            end if;
        end if;
    end process;

end Behavioral;
