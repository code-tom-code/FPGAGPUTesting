library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
    Port ( clk : in STD_LOGIC;
           vsync : out STD_LOGIC;
           hsync : out STD_LOGIC;
           port_r : out STD_LOGIC;
           port_g : out STD_LOGIC;
           port_b : out STD_LOGIC);
end test;

architecture Behavioral of test is
    
    pure function barycentricInside(barycentricVal : STD_LOGIC_VECTOR(19 downto 0) ) return std_logic is
    begin
        if (barycentricVal(19) = '0') then
            return '1';
        else
            return '0';
        end if;
    end function;
    
    pure function twosCompliment(val : STD_LOGIC_VECTOR(19 downto 0) ) return STD_LOGIC_VECTOR is
        variable onesCompliment : STD_LOGIC_VECTOR(19 downto 0);
        variable onesComplimentPlusOne : STD_LOGIC_VECTOR(19 downto 0);
    begin
        onesCompliment := not val;
        onesComplimentPlusOne := STD_LOGIC_VECTOR(unsigned(onesCompliment) + 1);
        return onesComplimentPlusOne;
    end function;

signal lineNumber : STD_LOGIC_VECTOR(9 downto 0) := (others => '0'); -- stores values from 0 to 1024, but we only need from 0 to 525
signal pixelNumber : STD_LOGIC_VECTOR(9 downto 0) := (others => '0'); -- stores values from 0 to 1024, but we only need from 0 to 800

signal barycentricA : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');
signal barycentricB : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');
signal barycentricC : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');

signal barycentricRowResetA : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');
signal barycentricRowResetB : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');
signal barycentricRowResetC : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');

signal frameCounter : STD_LOGIC_VECTOR(9 downto 0) := (others => '0'); -- This isn't used right now, so it really doesn't matter how many bits it has...

begin

    process(clk)
    
    constant barycentricXDeltaA : STD_LOGIC_VECTOR(19 downto 0) := "00000000000010000011"; -- dec 131
    constant barycentricXDeltaB : STD_LOGIC_VECTOR(19 downto 0) := "00000000000010000011"; -- dec 131
    constant barycentricXDeltaC : STD_LOGIC_VECTOR(19 downto 0) := twosCompliment(X"106"); -- dec -262
    
    constant barycentricYDeltaA : STD_LOGIC_VECTOR(19 downto 0) := twosCompliment(X"190"); -- dec -400
    constant barycentricYDeltaB : STD_LOGIC_VECTOR(19 downto 0) := "00000000000011001000"; -- dec 200
    constant barycentricYDeltaC : STD_LOGIC_VECTOR(19 downto 0) := "00000000000011001000"; -- dec 200
    
    constant barycentricInitialValuesA : STD_LOGIC_VECTOR(19 downto 0) := "00010011001100001000"; -- dec 78600
    constant barycentricInitialValuesB : STD_LOGIC_VECTOR(19 downto 0) := twosCompliment(X"13308"); -- dec -78600
    constant barycentricInitialValuesC : STD_LOGIC_VECTOR(19 downto 0) := "00010011001100000111"; -- dec 78599
    
    constant vsyncPulseWidthLines : integer := 2;
    constant hsyncBeginPixelX : integer := 704;
    constant bottomLineNumber : unsigned := to_unsigned(524, 10);
    constant rightmostPixelNumber : unsigned := to_unsigned(799, 10);
    
    constant safeZoneXMin : integer := 48;
    constant safeZoneXMax : integer := 688;
    constant safeZoneYMin : integer := 33;
    constant safeZoneYMax : integer := 513;
    
    begin
        if (rising_edge(clk) ) then
        
            -- Handle VSync (negative polarity sync pulse for 640x480@60Hz):
            if (unsigned(lineNumber) < vsyncPulseWidthLines) then
                vsync <= '0';
            else
                vsync <= '1';
            end if;
            
            -- Handle HSync (negative polarity sync pulse for 640x480@60Hz):
            if (unsigned(pixelNumber) < hsyncBeginPixelX) then
                hsync <= '1';
            else
                hsync <= '0';
            end if;
            
            -- Don't draw outside of the safe zone (between hblank and vblank regions) because otherwise monitors will have trouble
            -- calibrating RGB intensities (which they assume are set to 0 volts during these periods).
            if (unsigned(lineNumber) > safeZoneYMin and unsigned(lineNumber) < safeZoneYMax and unsigned(pixelNumber) > safeZoneXMin and unsigned(pixelNumber) < safeZoneXMax) then
                port_r <= barycentricInside(barycentricA);
                port_g <= barycentricInside(barycentricB);
                port_b <= barycentricInside(barycentricC);
            else
                port_r <= '0';
                port_g <= '0';
                port_b <= '0';
            end if;
            
            -- We've reached the bottom-most line, time to restart from the top again:
            if (unsigned(lineNumber) = bottomLineNumber) then -- 524 = 0x20C
                lineNumber <= (others => '0');
                pixelNumber <= (others => '0');
                frameCounter <= std_logic_vector(unsigned(frameCounter) + 1);
                
                barycentricA <= barycentricInitialValuesA;
                barycentricB <= barycentricInitialValuesB;
                barycentricC <= barycentricInitialValuesC;
                
                barycentricRowResetA <= barycentricInitialValuesA;
                barycentricRowResetB <= barycentricInitialValuesB;
                barycentricRowResetC <= barycentricInitialValuesC;
            else
                -- We've reached the rightmost pixel, time to restart at the left again:
                if (unsigned(pixelNumber) = rightmostPixelNumber) then -- 799 = 0x31F
                    pixelNumber <= (others => '0');
                    lineNumber <= std_logic_vector(unsigned(lineNumber) + 1);
                    
                    barycentricA <= barycentricRowResetA;
                    barycentricB <= barycentricRowResetB;
                    barycentricC <= barycentricRowResetC;
                    
                    barycentricRowResetA <= std_logic_vector(unsigned(barycentricRowResetA) + unsigned(barycentricYDeltaA) );
                    barycentricRowResetB <= std_logic_vector(unsigned(barycentricRowResetB) + unsigned(barycentricYDeltaB) );
                    barycentricRowResetC <= std_logic_vector(unsigned(barycentricRowResetC) + unsigned(barycentricYDeltaC) );
                -- We haven't reached anything, keep marching pixels along to the right (+X direction)
                else
                    pixelNumber <= std_logic_vector(unsigned(pixelNumber) + 1);
                    lineNumber <= lineNumber;
                    
                    barycentricA <= std_logic_vector(unsigned(barycentricA) + unsigned(barycentricXDeltaA) );
                    barycentricB <= std_logic_vector(unsigned(barycentricB) + unsigned(barycentricXDeltaB) );
                    barycentricC <= std_logic_vector(unsigned(barycentricC) + unsigned(barycentricXDeltaC) );
                end if;
            end if;
        end if;
    end process;

end Behavioral;
