library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TriRasterize is
    Port ( clk : in STD_LOGIC;
           newTriBegin : in STD_LOGIC;
           readyForNewTri : out STD_LOGIC;
           
           -- These all come from the Triangle Setup block:
           inMinX : in STD_LOGIC_VECTOR(10 downto 0);
           inMaxX : in STD_LOGIC_VECTOR(10 downto 0);
           inMinY : in STD_LOGIC_VECTOR(10 downto 0);
           inMaxY : in STD_LOGIC_VECTOR(10 downto 0);
           inInitialBarycentricRowResetA : in STD_LOGIC_VECTOR(19 downto 0);
           inInitialBarycentricRowResetB : in STD_LOGIC_VECTOR(19 downto 0);
           inInitialBarycentricRowResetC : in STD_LOGIC_VECTOR(19 downto 0);
           inIsTopLeftEdgeA : in STD_LOGIC;
           inIsTopLeftEdgeB : in STD_LOGIC;
           inIsTopLeftEdgeC : in STD_LOGIC;
           inBarycentricXDeltaA : in STD_LOGIC_VECTOR(10 downto 0);
           inBarycentricXDeltaB : in STD_LOGIC_VECTOR(10 downto 0);
           inBarycentricXDeltaC : in STD_LOGIC_VECTOR(10 downto 0);
           inBarycentricYDeltaA : in STD_LOGIC_VECTOR(10 downto 0);
           inBarycentricYDeltaB : in STD_LOGIC_VECTOR(10 downto 0);
           inBarycentricYDeltaC : in STD_LOGIC_VECTOR(10 downto 0);
           
           -- Out signals here go to the ROP FIFO and to the texture sampler
           outWriteX : out STD_LOGIC_VECTOR(9 downto 0);
           outWriteY : out STD_LOGIC_VECTOR(9 downto 0);
           outBarycentricA : out STD_LOGIC_VECTOR(15 downto 0);
           outBarycentricB : out STD_LOGIC_VECTOR(15 downto 0);
           outBarycentricC : out STD_LOGIC_VECTOR(15 downto 0);
           
           writeFifoFull : in STD_LOGIC;
           inside_tri : out STD_LOGIC);
end TriRasterize;

architecture Behavioral of TriRasterize is

    type state_t is (
        triRasterize_waitForTriData,
        
        triRasterize_initialVerticalAdvance,
                
        -- Finally, loop over and rasterize the whole triangle
        triRasterize_mainLoop,
        triRasterize_waitForWriteComplete,
        triRasterize_waitForWriteComplete2);
    
    pure function barycentricInside(barycentricVal : STD_LOGIC_VECTOR(19 downto 0) ) return std_logic is
    begin
        if (barycentricVal(19) = '0') then
            return '1';
        else
            return '0';
        end if;
    end function;

signal minX : signed(10 downto 0);
signal minY : signed(10 downto 0);
signal maxX : signed(10 downto 0);
signal maxY : signed(10 downto 0);

signal barycentricA : STD_LOGIC_VECTOR(19 downto 0);
signal barycentricB : STD_LOGIC_VECTOR(19 downto 0);
signal barycentricC : STD_LOGIC_VECTOR(19 downto 0);

signal isTopLeftEdgeA : STD_LOGIC;
signal isTopLeftEdgeB : STD_LOGIC;
signal isTopLeftEdgeC : STD_LOGIC;

signal barycentricRowResetA : STD_LOGIC_VECTOR(19 downto 0);
signal barycentricRowResetB : STD_LOGIC_VECTOR(19 downto 0);
signal barycentricRowResetC : STD_LOGIC_VECTOR(19 downto 0);

signal barycentricXDeltaA : STD_LOGIC_VECTOR(10 downto 0);
signal barycentricXDeltaB : STD_LOGIC_VECTOR(10 downto 0);
signal barycentricXDeltaC : STD_LOGIC_VECTOR(10 downto 0);

signal barycentricYDeltaA : STD_LOGIC_VECTOR(10 downto 0);
signal barycentricYDeltaB : STD_LOGIC_VECTOR(10 downto 0);
signal barycentricYDeltaC : STD_LOGIC_VECTOR(10 downto 0);

signal pixelNumber : STD_LOGIC_VECTOR(9 downto 0); -- stores values from 0 to 1024, but we only need from 0 to 800
signal lineNumber : STD_LOGIC_VECTOR(9 downto 0); -- stores values from 0 to 1024, but we only need from 0 to 525

signal currentState : state_t := triRasterize_waitForTriData;

signal stats_totalPixelsRasterized : unsigned(31 downto 0) := (others => '0');
 
begin

    process(clk)
    begin
        if (rising_edge(clk) ) then                                    
            case currentState is            
                -- Load new triangle data
                when triRasterize_waitForTriData =>
                    readyForNewTri <= '1';
                    if (newTriBegin = '1') then
                        -- TODO: Set these to minX/minY instead when the initial barycentrics get recalculated to
                        -- account for the new starting position
                        pixelNumber <= "0000000000";
                        lineNumber <= "0000000000";
                        
                        -- Read in all of our variables from Triangle Setup so that TriSetup can move on to processing the next triangle and
                        -- so that we can work on rasterizing our triangles purely from internal registers alone
                        minX <= signed(inMinX);
                        maxX <= signed(inMaxX);
                        minY <= signed(inMinY);
                        maxY <= signed(inMaxY);
                        isTopLeftEdgeA <= inIsTopLeftEdgeA;
                        isTopLeftEdgeB <= inIsTopLeftEdgeB;
                        isTopLeftEdgeC <= inIsTopLeftEdgeC;
                        barycentricRowResetA <= inInitialBarycentricRowResetA;
                        barycentricRowResetB <= inInitialBarycentricRowResetB;
                        barycentricRowResetC <= inInitialBarycentricRowResetC;
                        barycentricXDeltaA <= inBarycentricXDeltaA;
                        barycentricXDeltaB <= inBarycentricXDeltaB;
                        barycentricXDeltaC <= inBarycentricXDeltaC;
                        barycentricYDeltaA <= inBarycentricYDeltaA;
                        barycentricYDeltaB <= inBarycentricYDeltaB;
                        barycentricYDeltaC <= inBarycentricYDeltaC;
                        
                        -- Set the initial values of our barycentric coordinates to the starting row reset values:
                        barycentricA <= inInitialBarycentricRowResetA;
                        barycentricB <= inInitialBarycentricRowResetB;
                        barycentricC <= inInitialBarycentricRowResetC;
                        
                        readyForNewTri <= '0';
                        inside_tri <= '0';
                        if (signed(inMinY) > 0) then
                            currentState <= triRasterize_initialVerticalAdvance;
                        else
                            currentState <= triRasterize_mainLoop;
                        end if;
                    end if;
                    
                    -- Advance vertically until we reach minY
                when triRasterize_initialVerticalAdvance =>
                    if (unsigned(lineNumber) < unsigned(minY) ) then
                        barycentricA <= std_logic_vector(signed(barycentricRowResetA) + resize(signed(barycentricYDeltaA), barycentricRowResetA'length) );
                        barycentricB <= std_logic_vector(signed(barycentricRowResetB) + resize(signed(barycentricYDeltaB), barycentricRowResetB'length) );
                        barycentricC <= std_logic_vector(signed(barycentricRowResetC) + resize(signed(barycentricYDeltaC), barycentricRowResetC'length) );                        
                        barycentricRowResetA <= std_logic_vector(signed(barycentricRowResetA) + resize(signed(barycentricYDeltaA), barycentricRowResetA'length) );
                        barycentricRowResetB <= std_logic_vector(signed(barycentricRowResetB) + resize(signed(barycentricYDeltaB), barycentricRowResetB'length) );
                        barycentricRowResetC <= std_logic_vector(signed(barycentricRowResetC) + resize(signed(barycentricYDeltaC), barycentricRowResetC'length) );
                        lineNumber <= std_logic_vector(unsigned(lineNumber) + 1);
                    else
                        currentState <= triRasterize_mainLoop; -- Start the triangle rasterization state machine
                    end if;
                when triRasterize_mainLoop =>
                    if (unsigned(pixelNumber) < unsigned(maxX) and unsigned(lineNumber) < unsigned(maxY) ) then
                        if (barycentricInside(barycentricA) = '1' and barycentricInside(barycentricB) = '1' and barycentricInside(barycentricC) = '1') then
                            if (isTopLeftEdgeA = '0') then
                                outBarycentricA <= std_logic_vector(unsigned(barycentricA(15 downto 0) ) + 1);
                            else
                                outBarycentricA <= barycentricA(15 downto 0);
                            end if;
                            if (isTopLeftEdgeB = '0') then
                                outBarycentricB <= std_logic_vector(unsigned(barycentricB(15 downto 0) ) + 1);
                            else
                                outBarycentricB <= barycentricB(15 downto 0);
                            end if;
                            if (isTopLeftEdgeC = '0') then
                                outBarycentricC <= std_logic_vector(unsigned(barycentricC(15 downto 0) ) + 1);
                            else
                                outBarycentricC <= barycentricC(15 downto 0);
                            end if;
                            
                            outWriteX <= pixelNumber;
                            outWriteY <= lineNumber;
                            inside_tri <= '0';
                            currentState <= triRasterize_waitForWriteComplete;
                        else
                            inside_tri <= '0';
                        end if;
                        
                        -- We haven't reached anything, keep marching pixels along to the right (+X direction)
                        pixelNumber <= std_logic_vector(unsigned(pixelNumber) + 1);
                        barycentricA <= std_logic_vector(signed(barycentricA) + resize(signed(barycentricXDeltaA), barycentricA'length) ) ;
                        barycentricB <= std_logic_vector(signed(barycentricB) + resize(signed(barycentricXDeltaB), barycentricB'length) ) ;
                        barycentricC <= std_logic_vector(signed(barycentricC) + resize(signed(barycentricXDeltaC), barycentricC'length) ) ;
                    elsif (unsigned(pixelNumber) = unsigned(maxX) ) then
                        -- We've reached the rightmost pixel, time to restart at the left again:
                        pixelNumber <= "0000000000"; -- TODO: Set this to minX instead after the initial barycentrics have been recalculated to account for the new starting position
                        lineNumber <= std_logic_vector(unsigned(lineNumber) + 1);
                        inside_tri <= '0';
                        barycentricA <= std_logic_vector(signed(barycentricRowResetA) + resize(signed(barycentricYDeltaA), barycentricRowResetA'length) );
                        barycentricB <= std_logic_vector(signed(barycentricRowResetB) + resize(signed(barycentricYDeltaB), barycentricRowResetB'length) );
                        barycentricC <= std_logic_vector(signed(barycentricRowResetC) + resize(signed(barycentricYDeltaC), barycentricRowResetC'length) );                        
                        barycentricRowResetA <= std_logic_vector(signed(barycentricRowResetA) + resize(signed(barycentricYDeltaA), barycentricRowResetA'length) );
                        barycentricRowResetB <= std_logic_vector(signed(barycentricRowResetB) + resize(signed(barycentricYDeltaB), barycentricRowResetB'length) );
                        barycentricRowResetC <= std_logic_vector(signed(barycentricRowResetC) + resize(signed(barycentricYDeltaC), barycentricRowResetC'length) );
                    elsif (unsigned(lineNumber) = unsigned(maxY) ) then
                        -- We've reached the bottom! We're done with this triangle!
                        inside_tri <= '0';
                        currentState <= triRasterize_waitForTriData;
                    end if;
                when triRasterize_waitForWriteComplete =>
                    if (writeFifoFull = '0') then
                        inside_tri <= '1';
                        currentState <= triRasterize_waitForWriteComplete2;
                    end if;
                when triRasterize_waitForWriteComplete2 =>
                    inside_tri <= '0';
                    stats_totalPixelsRasterized <= stats_totalPixelsRasterized + 1;
                    currentState <= triRasterize_mainLoop;
            end case;
        end if;
    end process;

end Behavioral;
