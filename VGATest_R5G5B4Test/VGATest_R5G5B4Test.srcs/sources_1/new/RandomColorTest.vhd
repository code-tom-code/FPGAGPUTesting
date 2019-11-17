library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RandomColorTest is
    generic (initialSeed : STD_LOGIC_VECTOR(31 downto 0) := "01010101010101010101010101010101" );
    Port ( clk : in STD_LOGIC;
           isValidPixel : in STD_LOGIC;
           red8 : out STD_LOGIC_VECTOR(7 downto 0);
           green8 : out STD_LOGIC_VECTOR(7 downto 0);
           blue8 : out STD_LOGIC_VECTOR(7 downto 0) );
end RandomColorTest;

architecture Behavioral of RandomColorTest is

signal seedState : STD_LOGIC_VECTOR(31 downto 0) := initialSeed;
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
        variable a0 : unsigned(9 downto 0) := (others => '0');
        variable b0 : unsigned(9 downto 0) := (others => '0');
    begin
        if (rising_edge(clk) ) then
            if (isValidPixel = '1') then
                red8 <= seedState(23 downto 16);
                green8 <= seedState(15 downto 8);
                blue8 <= seedState(7 downto 0);
            else
                red8 <= "00000000";
                green8 <= "00000000";
                blue8 <= "00000000";
            end if;
                
            x0 := to_bitvector(seedState); -- start with the seed state
                            
            x1 := x0 sll 13; -- x ^= x << 13;
            x2 := x1 xor x0;
            
            x3 := x2 srl 17; -- x ^= x >> 17;
            x4 := x3 xor x2;
            
            x5 := x4 sll 5; -- x ^= x << 5;
            x6 := x5 xor x4;
            
            a0 := unsigned(To_StdLogicVector(x6(9 downto 0) ) );
            b0 := unsigned(To_StdLogicVector(x6(20 downto 11) ) );
            
            if (a0 >= 688) then
                a0 := a0 - 688;
            elsif (a0 <= 48) then
                a0 := a0 + 48;
            end if;
            
            if (b0 <= 34) then
                b0 := b0 + 34;
            elsif (b0 >= 512) then
                b0 := b0 - 512;                        
            end if;
            
            if (b0 >= 512) then
                b0 := b0 - 512;
            end if;
            
            seedState <= To_StdLogicVector(x6(31 downto 21) ) & std_logic_vector(b0) & '0' & std_logic_vector(a0);
        end if;
    end process;

end Behavioral;
