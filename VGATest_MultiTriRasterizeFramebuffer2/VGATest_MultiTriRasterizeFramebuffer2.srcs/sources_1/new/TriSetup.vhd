library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TriSetup is
    generic (NumNewtonRaphsonIterations : integer := 5);
    Port ( clk : in STD_LOGIC;
           v0_in_x : in STD_LOGIC_VECTOR(10 downto 0);
           v0_in_y : in STD_LOGIC_VECTOR(10 downto 0);
           v0_in_invZ : in STD_LOGIC_VECTOR(23 downto 0);
           v1_in_x : in STD_LOGIC_VECTOR(10 downto 0);
           v1_in_y : in STD_LOGIC_VECTOR(10 downto 0);
           v1_in_invZ : in STD_LOGIC_VECTOR(23 downto 0);
           v2_in_x : in STD_LOGIC_VECTOR(10 downto 0);
           v2_in_y : in STD_LOGIC_VECTOR(10 downto 0);
           v2_in_invZ : in STD_LOGIC_VECTOR(23 downto 0);
           t0_in_x : in STD_LOGIC_VECTOR(15 downto 0);
           t0_in_y : in STD_LOGIC_VECTOR(15 downto 0);
           t1_in_x : in STD_LOGIC_VECTOR(15 downto 0);
           t1_in_y : in STD_LOGIC_VECTOR(15 downto 0);
           t2_in_x : in STD_LOGIC_VECTOR(15 downto 0);
           t2_in_y : in STD_LOGIC_VECTOR(15 downto 0);
           
           -- Means that none of the vertex attributes need to be interpolated (so we can skip a ton of steps)
           nointerpolation : in STD_LOGIC;
           
           --triColor_in_R : in STD_LOGIC_VECTOR(7 downto 0); -- TODO: Replace this with vertex color
           --triColor_in_G : in STD_LOGIC_VECTOR(7 downto 0);
           --triColor_in_B : in STD_LOGIC_VECTOR(7 downto 0);
           newTriBegin : in STD_LOGIC;
           readyForNewTri : out STD_LOGIC;
           outBarycentricInverse : out STD_LOGIC_VECTOR(15 downto 0); -- This is a fixed-point value in unsigned Q0.16 format
           v0_out_invZ : out STD_LOGIC_VECTOR(23 downto 0);
           v1_out_invZ : out STD_LOGIC_VECTOR(23 downto 0);
           v2_out_invZ : out STD_LOGIC_VECTOR(23 downto 0);
           t0_out_x : out STD_LOGIC_VECTOR(15 downto 0);
           t0_out_y : out STD_LOGIC_VECTOR(15 downto 0);
           t1_out_x : out STD_LOGIC_VECTOR(15 downto 0);
           t1_out_y : out STD_LOGIC_VECTOR(15 downto 0);
           t2_out_x : out STD_LOGIC_VECTOR(15 downto 0);
           t2_out_y : out STD_LOGIC_VECTOR(15 downto 0);
           --outColorR : out STD_LOGIC_VECTOR(7 downto 0);
           --outColorG : out STD_LOGIC_VECTOR(7 downto 0);
           --outColorB : out STD_LOGIC_VECTOR(7 downto 0);
           
           outMinX : out STD_LOGIC_VECTOR(10 downto 0);
           outMaxX : out STD_LOGIC_VECTOR(10 downto 0);
           outMinY : out STD_LOGIC_VECTOR(10 downto 0);
           outMaxY : out STD_LOGIC_VECTOR(10 downto 0);
           outInitialBarycentricRowResetA : out STD_LOGIC_VECTOR(19 downto 0);
           outInitialBarycentricRowResetB : out STD_LOGIC_VECTOR(19 downto 0);
           outInitialBarycentricRowResetC : out STD_LOGIC_VECTOR(19 downto 0);
           outIsTopLeftEdgeA : out STD_LOGIC;
           outIsTopLeftEdgeB : out STD_LOGIC;
           outIsTopLeftEdgeC : out STD_LOGIC;
           outBarycentricXDeltaA : out STD_LOGIC_VECTOR(10 downto 0);
           outBarycentricXDeltaB : out STD_LOGIC_VECTOR(10 downto 0);
           outBarycentricXDeltaC : out STD_LOGIC_VECTOR(10 downto 0);
           outBarycentricYDeltaA : out STD_LOGIC_VECTOR(10 downto 0);
           outBarycentricYDeltaB : out STD_LOGIC_VECTOR(10 downto 0);
           outBarycentricYDeltaC : out STD_LOGIC_VECTOR(10 downto 0);
           
           readyForTriSetupData : in STD_LOGIC;
           triSetupDataIsValid : out STD_LOGIC);
end TriSetup;

architecture Behavioral of TriSetup is

    type state_t is (
        triSetup_waitForTriData,
        
        triSetup_duplicateVertexCull,
        
        -- Bounds calculations and trivial rejection culling:
        triSetup_bounds,
        triSetup_boundsClamp,
        triSetup_boundsCull,
        
        -- Compute cross-product to get (signed) twiceTriangleArea
        triSetup_crossProduct,
        triSetup_crossProduct2,
        triSetup_crossProduct3,
        triSetup_crossProduct4,
        
        -- Backface cull (cull if twiceTriangleArea <= 0)
        triSetup_backfaceCull,
        
        -- Compute barycentric normalization factor (needed for attribute interpolation)
        -- Please skip all of these stages if we don't need to interpolate attributes (solid color, or flat shading)
        triSetup_findFixedNormalizeFactor,
        triSetup_normalizeFixedTwiceTriArea,
        triSetup_x0Product,
        triSetup_x0ProductShift,
        triSetup_x0Difference,
        triSetup_NewtonIter0_x1innerProduct,
        triSetup_NewtonIter0_x1innerProductShift,
        triSetup_NewtonIter0_x1difference,
        triSetup_NewtonIter0_x1product,
        triSetup_NewtonIter0_x1productShift,
        triSetup_findUnnormalizedBarycentricInverse,
        
        -- Compute top-left edge rule offsets
        triSetup_topLeftBiasA,
        triSetup_topLeftBiasB,
        triSetup_topLeftBiasC,
        
        -- Compute barycentric deltas
        triSetup_barycentricXDeltaA,
        triSetup_barycentricXDeltaB,
        triSetup_barycentricXDeltaC,
        triSetup_barycentricYDeltaA,
        triSetup_barycentricYDeltaB,
        triSetup_barycentricYDeltaC,
        
        -- Compute barycentric values
        triSetup_negate,
        triSetup_leftInner0,
        triSetup_leftInner1,
        triSetup_leftInner2,
        triSetup_rightInner0,
        triSetup_rightInner1,
        triSetup_rightInner2,
        triSetup_leftProduct0,
        triSetup_leftProduct1,
        triSetup_leftProduct2,
        triSetup_rightProduct0,
        triSetup_rightProduct1,
        triSetup_rightProduct2,
        triSetup_crossProductSumA,
        triSetup_crossProductSumB,
        triSetup_crossProductSumC,
        triSetup_applyTopLeftRule,
        triSetup_broadcastOutput);
        
    -- Assumes value is nonzero
    pure function bitScan(value : unsigned(22 downto 0) ) return unsigned is
    begin
        assert value > 0;
        for bitIndex in 0 to 22 loop
            if (value(22 - bitIndex) = '1') then
                return to_unsigned(22 - bitIndex + 1, 5);
            end if;
        end loop;
        return to_unsigned(0, 5);
    end function;
    
    pure function isTopLeftEdge(vertA_X : signed(10 downto 0); 
        vertA_Y : signed(10 downto 0); 
        vertB_X : signed(10 downto 0); 
        vertB_Y : signed(10 downto 0) ) return std_logic is
    variable dx : signed(10 downto 0);
    variable dy : signed(10 downto 0);
    begin
        dx := vertB_X - vertA_X;
        dy := vertB_Y - vertA_Y;
        if (dy < 0) then
            return '1';
        elsif ( (dy = 0) and (dx < 0) ) then
            return '1';
        else
            return '0';
        end if;
    end function;
    
    pure function boundsMin(a : signed(10 downto 0);
                            b : signed(10 downto 0);
                            c : signed(10 downto 0) ) return signed is
    begin
        if (a < b) then
            if (a < c) then
                return a;
            else
                return c;
            end if;
        else
            if (b < c) then
                return b;
            else
                return c;
            end if;
        end if;
    end function;
    
    pure function boundsMax(a : signed(10 downto 0);
                            b : signed(10 downto 0);
                            c : signed(10 downto 0) ) return signed is
    begin
        if (a > b) then
            if (a > c) then
                return a;
            else
                return c;
            end if;
        else
            if (b > c) then
                return b;
            else
                return c;
            end if;
        end if;
    end function;
    
    pure function applyTopLeftRuleBarycentricAdjustment(barycentricCoord : STD_LOGIC_VECTOR(19 downto 0);
                                                        isTopLeftEdge : STD_LOGIC ) return STD_LOGIC_VECTOR is
    begin
        if (isTopLeftEdge = '1') then
            return std_logic_vector(signed(barycentricCoord) - 1);
        else
            return barycentricCoord;
        end if;
    end function;
        
-- External store signals
signal v0_store_x : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
signal v0_store_y : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
signal v0_store_invZ : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
signal v1_store_x : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
signal v1_store_y : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
signal v1_store_invZ : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
signal v2_store_x : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
signal v2_store_y : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
signal v2_store_invZ : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
signal t0_store_x : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal t0_store_y : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal t1_store_x : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal t1_store_y : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal t2_store_x : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal t2_store_y : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

-- Internal signals
signal readyForNextTriSig : STD_LOGIC := '1';
signal currentState : state_t := triSetup_waitForTriData;

-- Internal computation intermediaries
signal v0_x : signed(10 downto 0) := to_signed(320, 11); -- 11 bit signed integer
signal v0_y : signed(10 downto 0) := to_signed(120, 11);
signal v1_x : signed(10 downto 0) := to_signed(480, 11);
signal v1_y : signed(10 downto 0) := to_signed(360, 11);
signal v2_x : signed(10 downto 0) := to_signed(160, 11);
signal v2_y : signed(10 downto 0) := to_signed(240, 11);

signal nv0_x : signed(10 downto 0) := (others => '0'); -- 11 bit signed integer
signal nv0_y : signed(10 downto 0) := (others => '0');
signal nv1_x : signed(10 downto 0) := (others => '0');
signal nv1_y : signed(10 downto 0) := (others => '0');
signal nv2_x : signed(10 downto 0) := (others => '0');
signal nv2_y : signed(10 downto 0) := (others => '0');

signal minX : signed(10 downto 0) := (others => '0'); -- Triangle AABB clipped to screenspace (x is 0 to 639, y is 0 to 479)
signal minY : signed(10 downto 0) := (others => '0');
signal maxX : signed(10 downto 0) := (others => '0');
signal maxY : signed(10 downto 0) := (others => '0');

signal crossProdSub0 : signed(11 downto 0) := (others => '0'); -- Cross product temporaries
signal crossProdSub1 : signed(11 downto 0) := (others => '0');
signal crossProdSub2 : signed(11 downto 0) := (others => '0');
signal crossProdSub3 : signed(11 downto 0) := (others => '0');
signal crossProdProd0 : signed(23 downto 0) := (others => '0');
signal crossProdProd1 : signed(23 downto 0) := (others => '0');

signal leftInner0 : signed(11 downto 0) := (others => '0'); -- 12 bit signed integer
signal leftInner1 : signed(11 downto 0) := (others => '0');
signal leftInner2 : signed(11 downto 0) := (others => '0');

signal rightInner0 : signed(11 downto 0) := (others => '0');
signal rightInner1 : signed(11 downto 0) := (others => '0');
signal rightInner2 : signed(11 downto 0) := (others => '0');

signal leftProduct0 : signed(22 downto 0) := (others => '0'); -- 23 bit signed integer
signal leftProduct1 : signed(22 downto 0) := (others => '0');
signal leftProduct2 : signed(22 downto 0) := (others => '0');

signal rightProduct0 : signed(22 downto 0) := (others => '0');
signal rightProduct1 : signed(22 downto 0) := (others => '0');
signal rightProduct2 : signed(22 downto 0) := (others => '0');

signal isTopLeftEdgeA : STD_LOGIC := '0';
signal isTopLeftEdgeB : STD_LOGIC := '0';
signal isTopLeftEdgeC : STD_LOGIC := '0';

-- Note that the triangle does get backface-culled in the case that this is a negative or zero value
signal twiceTriangleArea : signed(23 downto 0) := (others => '0'); -- This must be signed so we can test if it's negative or not
signal barycentricInverse_normalizeFactor : unsigned(4 downto 0) := (others => '0');

-- This is technically a number in Q16.16 fixed-point format, but because we know that twiceTriangleArea is an unsigned int between 1 and 2^23-1, we
-- know that the normalized inverse will always be between (0.5, 1.0) and so we can just ignore all of the integer part of the fixed-point value since it'll
-- always be 0. 
signal barycentricInverse_normalizedTwiceTriangleArea : unsigned(15 downto 0) := (others => '0'); -- Q0.16, value between (0.5, 1.0)
constant initialGuessScale : unsigned(16 downto 0) := to_unsigned(123361, 17); -- +1.8823529411764705882352941176471dec = +1.e1e1hex = 123361dec as uint32
constant initialGuessBias : unsigned(17 downto 0) := to_unsigned(185042, 18); -- +2.8235294117647058823529411764706dec = +2.d2d2hex = 185042dec as uint32
constant iterationSubtractTwo : unsigned(17 downto 0) := to_unsigned(131072, 18); -- +2.0 = +2.0000 hex = 131072dec as uint32
signal unshifted_x0product : unsigned(32 downto 0) := (others => '0');
signal x0product : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value between (16/17, 32/17) or (0.941176, 1.882353)
signal x0result : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value between (16/17, 32/17) or (0.941176, 1.882353) (same range as x0product)
signal newtonIterCount : unsigned(2 downto 0) := (others => '0'); -- Counts from 0 to 5 and then resets
signal unshifted_x1innerProduct : unsigned(32 downto 0) := (others => '0');
signal x1innerProduct : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value range for first iteration between (8/17, 32/17) or (0.470588, 1.882353)
signal x1difference : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value range for first iteration between (2/17, 26/17) or (0.117647, 1.529411)
signal unshifted_x1 : unsigned(33 downto 0) := (others => '0');
signal x1 : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value range for first iteration between (0.110727, 2.878891) (don't worry this never actually goes over 1.9 in practice so it'll fit into a Q1.16)
signal barycentricInverse : unsigned(15 downto 0) := (others => '0'); -- Q0.16, value between (0.0, 1.0)

signal barycentricRowResetA : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');
signal barycentricRowResetB : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');
signal barycentricRowResetC : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');

signal barycentricXDeltaA : STD_LOGIC_VECTOR(10 downto 0);--:= "00010000011"; -- dec 131
signal barycentricXDeltaB : STD_LOGIC_VECTOR(10 downto 0);-- := "00010000011"; -- dec 131
signal barycentricXDeltaC : STD_LOGIC_VECTOR(10 downto 0);-- := twosCompliment("00100000110"); -- dec -262

signal barycentricYDeltaA : STD_LOGIC_VECTOR(10 downto 0);-- := twosCompliment("00110010000"); -- dec -400
signal barycentricYDeltaB : STD_LOGIC_VECTOR(10 downto 0);-- := "00011001000"; -- dec 200
signal barycentricYDeltaC : STD_LOGIC_VECTOR(10 downto 0);-- := "00011001000"; -- dec 200

signal stats_totalTrianglesDuplicateVertCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesZeroAreaBoundsCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesZeroAreaTriCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesBackfaceCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesPassed : unsigned(11 downto 0) := (others => '0');

begin

    process(clk)
        variable bitshiftTemporary : unsigned(38 downto 0) := (others => '0');
        variable productShiftTemporary : unsigned(32 downto 0) := (others => '0');
        variable bigProductTemporary : unsigned(33 downto 0) := (others => '0');
        variable subtractTemporary : unsigned(17 downto 0) := (others => '0');
        variable bitshift2Temporary : unsigned(16 downto 0) := (others => '0');
    begin
        if (rising_edge(clk) ) then
            readyForNewTri <= readyForNextTriSig;
                        
            case currentState is
                -- Load new triangle data
                when triSetup_waitForTriData =>
                    triSetupDataIsValid <= '0';
                    readyForNextTriSig <= '1';
                    if (newTriBegin = '1') then
                        v0_x <= signed('0' & v0_in_x(9 downto 0) );
                        v0_y <= signed('0' & v0_in_y(9 downto 0) );
                        v1_x <= signed('0' & v1_in_x(9 downto 0) );
                        v1_y <= signed('0' & v1_in_y(9 downto 0) );
                        v2_x <= signed('0' & v2_in_x(9 downto 0) );
                        v2_y <= signed('0' & v2_in_y(9 downto 0) );
                        --triColorR <= triColor_in_R; -- TODO: Replace this with vertex color
                        --triColorG <= triColor_in_G;
                        --triColorB <= triColor_in_B;
                        v0_store_x <= v0_in_x;
                        v0_store_y <= v0_in_y;
                        v0_store_invZ <= v0_in_invZ;
                        v1_store_x <= v1_in_x;
                        v1_store_y <= v1_in_y;
                        v1_store_invZ <= v1_in_invZ;
                        v2_store_x <= v2_in_x;
                        v2_store_y <= v2_in_y;
                        v2_store_invZ <= v2_in_invZ;
                        t0_store_x <= t0_in_x;
                        t0_store_y <= t0_in_y;
                        t1_store_x <= t1_in_x;
                        t1_store_y <= t1_in_y;
                        t2_store_x <= t2_in_x;
                        t2_store_y <= t2_in_y;
                        readyForNextTriSig <= '0';
                        currentState <= triSetup_duplicateVertexCull; -- Start the triangle setup state machine
                    end if;
                    
                -- Triangle setup code
                
                when triSetup_duplicateVertexCull =>
                    if ( ( (v0_store_x = v1_store_x) and (v0_store_y = v1_store_y) ) or -- 0 = 1
                        ( (v1_store_x = v2_store_x) and (v1_store_y = v2_store_y) ) or -- 1 = 2
                        ( (v0_store_x = v2_store_x) and (v0_store_y = v2_store_y) ) ) then -- 0 = 2
                        readyForNextTriSig <= '1';
                        stats_totalTrianglesDuplicateVertCulled <= stats_totalTrianglesDuplicateVertCulled + 1;
                        currentState <= triSetup_waitForTriData;
                    else
                        currentState <= triSetup_bounds;
                    end if;
                
                -- Compute quad bounds first:
                when triSetup_bounds =>
                    minX <= boundsMin(v0_x, v1_x, v2_x);
                    maxX <= boundsMax(v0_x, v1_x, v2_x);
                    minY <= boundsMin(v0_y, v1_y, v2_y);
                    maxY <= boundsMax(v0_y, v1_y, v2_y);
                    currentState <= triSetup_boundsClamp;
                when triSetup_boundsClamp =>
                    if (minX < 0) then
                        minX <= to_signed(0, 11);
                    end if;
                    if (minY < 0) then
                        minY <= to_signed(0, 11);
                    end if;
                    if (maxX > 639) then
                        maxX <= to_signed(639, 11);
                    end if;
                    if (maxY > 479) then
                        maxY <= to_signed(479, 11);
                    end if;
                    currentState <= triSetup_boundsCull;
                    
                -- Cull zero-area triangles:
                when triSetup_boundsCull =>
                    if ( (minX >= maxX) or (minY >= maxY) ) then
                        readyForNextTriSig <= '1';
                        stats_totalTrianglesZeroAreaBoundsCulled <= stats_totalTrianglesZeroAreaBoundsCulled + 1;
                        currentState <= triSetup_waitForTriData;
                    else
                        currentState <= triSetup_crossProduct;
                    end if;
                    
                -- TwiceTriangleArea = (i1.x - i0.x) * (i2.y - i0.y) - (i1.y - i0.y) * (i2.x - i0.x)
                -- TwiceTriangleArea = sub0 * sub1 - sub2 * sub3
                -- TwiceTriangleArea = prod0 - prod1
                when triSetup_crossProduct =>
                    crossProdSub0 <= resize(v1_x, crossProdSub0'length) - resize(v0_x, crossProdSub0'length); -- (i1.x - i0.x)
                    crossProdSub1 <= resize(v2_y, crossProdSub0'length) - resize(v0_y, crossProdSub0'length); -- (i2.y - i0.y)
                    crossProdSub2 <= resize(v1_y, crossProdSub0'length) - resize(v0_y, crossProdSub0'length); -- (i1.y - i0.y)
                    crossProdSub3 <= resize(v2_x, crossProdSub0'length) - resize(v0_x, crossProdSub0'length); -- (i2.x - i0.x)
                    currentState <= triSetup_crossProduct2;
                    
                when triSetup_crossProduct2 =>
                    crossProdProd0 <= crossProdSub0 * crossProdSub1;
                    currentState <= triSetup_crossProduct3;
                    
                when triSetup_crossProduct3 =>
                    crossProdProd1 <= crossProdSub2 * crossProdSub3;
                    currentState <= triSetup_crossProduct4;
                    
                when triSetup_crossProduct4 =>
                    twiceTriangleArea <= crossProdProd0 - crossProdProd1;
                    currentState <= triSetup_backfaceCull;
                
                -- Backface cull if the triangle has a negative area (facing away from the screen) or
                -- if it has zero area (too small)
                when triSetup_backfaceCull =>
                    if (twiceTriangleArea < 0) then
                        readyForNextTriSig <= '1';
                        stats_totalTrianglesBackfaceCulled <= stats_totalTrianglesBackfaceCulled + 1;
                        currentState <= triSetup_waitForTriData;
                    elsif (twiceTriangleArea = 0) then
                        readyForNextTriSig <= '1';
                        stats_totalTrianglesZeroAreaTriCulled <= stats_totalTrianglesZeroAreaTriCulled + 1;
                        currentState <= triSetup_waitForTriData;
                    else
                        if (nointerpolation = '1') then
                            currentState <= triSetup_topLeftBiasA;
                        else
                            currentState <= triSetup_findFixedNormalizeFactor;
                        end if;
                    end if;
                
                -- Calculate the inverse of the twiceTriangleArea using fixed-point math:
                when triSetup_findFixedNormalizeFactor =>
                    barycentricInverse_normalizeFactor <= bitScan(unsigned(twiceTriangleArea(22 downto 0) ) );
                    currentState <= triSetup_normalizeFixedTwiceTriArea;
                    
                when triSetup_normalizeFixedTwiceTriArea =>
                    bitshiftTemporary := (unsigned(twiceTriangleArea(22 downto 0) ) & "0000000000000000") srl to_integer(barycentricInverse_normalizeFactor);
                    barycentricInverse_normalizedTwiceTriangleArea <= bitshiftTemporary(15 downto 0);
                    currentState <= triSetup_x0Product;
                    
                when triSetup_x0Product =>
                    unshifted_x0product <= barycentricInverse_normalizedTwiceTriangleArea * initialGuessScale;
                    currentState <= triSetup_x0ProductShift;
                    
                when triSetup_x0ProductShift =>
                    productShiftTemporary := unshifted_x0product srl 16; 
                    x0product <= productShiftTemporary(16 downto 0);
                    currentState <= triSetup_x0Difference;
                    
                when triSetup_x0Difference =>
                    subtractTemporary := initialGuessBias - x0product; 
                    x0result <= subtractTemporary(16 downto 0);
                    newtonIterCount <= "000";
                    currentState <= triSetup_NewtonIter0_x1innerProduct;
                
                -- Perform each iteration of Newton-Raphson method:
                when triSetup_NewtonIter0_x1innerProduct =>
                    unshifted_x1innerProduct <= barycentricInverse_normalizedTwiceTriangleArea * x0result;
                    currentState <= triSetup_NewtonIter0_x1innerProductShift;
                    
                when triSetup_NewtonIter0_x1innerProductShift =>
                    productShiftTemporary := unshifted_x1innerProduct srl 16;
                    x1innerProduct <= productShiftTemporary(16 downto 0);
                    currentState <= triSetup_NewtonIter0_x1difference;
                
                when triSetup_NewtonIter0_x1difference =>
                    subtractTemporary := iterationSubtractTwo - x1innerProduct;
                    x1difference <= subtractTemporary(16 downto 0);
                    currentState <= triSetup_NewtonIter0_x1product;
                
                when triSetup_NewtonIter0_x1product =>
                    unshifted_x1 <= x0result * x1difference;
                    currentState <= triSetup_NewtonIter0_x1productShift;
                    
                when triSetup_NewtonIter0_x1productShift =>
                    bigProductTemporary := unshifted_x1 srl 16;
                    x1 <= bigProductTemporary(16 downto 0);
                    if ( (newtonIterCount < (NumNewtonRaphsonIterations - 1) ) and
                        bigProductTemporary(16 downto 0) /= x0result) then
                        newtonIterCount <= newtonIterCount + 1;
                        x0result <= bigProductTemporary(16 downto 0);
                        currentState <= triSetup_NewtonIter0_x1innerProduct;
                    else
                        currentState <= triSetup_findUnnormalizedBarycentricInverse;
                    end if;
                    
                -- Finish computing the barycentric inverse by unnormalizing it back from the (0.5, 1.0) range to its normal range
                when triSetup_findUnnormalizedBarycentricInverse =>
                    bitshift2Temporary := x1 srl to_integer(barycentricInverse_normalizeFactor);
                    barycentricInverse <= bitshift2Temporary(15 downto 0);
                    currentState <= triSetup_topLeftBiasA;
                    
                when triSetup_topLeftBiasA =>
                    isTopLeftEdgeA <= isTopLeftEdge(v1_x, v1_y, v2_x, v2_y);
                    currentState <= triSetup_topLeftBiasB;
                when triSetup_topLeftBiasB =>
                    isTopLeftEdgeB <= isTopLeftEdge(v2_x, v2_y, v0_x, v0_y);
                    currentState <= triSetup_topLeftBiasC;
                when triSetup_topLeftBiasC =>
                    isTopLeftEdgeC <= isTopLeftEdge(v0_x, v0_y, v1_x, v1_y);
                    currentState <= triSetup_barycentricXDeltaA;
                    
                -- Calculate barycentric X and Y deltas (one integer subtraction per cycle)
                when triSetup_barycentricXDeltaA =>
                    barycentricXDeltaA <= std_logic_vector(v1_y - v2_y);
                    currentState <= triSetup_barycentricXDeltaB;
                when triSetup_barycentricXDeltaB =>
                    barycentricXDeltaB <= std_logic_vector(v2_y - v0_y);
                    currentState <= triSetup_barycentricXDeltaC;
                when triSetup_barycentricXDeltaC =>
                    barycentricXDeltaC <= std_logic_vector(v0_y - v1_y);
                    currentState <= triSetup_barycentricYDeltaA;
                when triSetup_barycentricYDeltaA =>
                    barycentricYDeltaA <= std_logic_vector(v2_x - v1_x);
                    currentState <= triSetup_barycentricYDeltaB;
                when triSetup_barycentricYDeltaB =>
                    barycentricYDeltaB <= std_logic_vector(v0_x - v2_x);
                    currentState <= triSetup_barycentricYDeltaC;
                when triSetup_barycentricYDeltaC =>
                    barycentricYDeltaC <= std_logic_vector(v1_x - v0_x);
                    currentState <= triSetup_negate;
                    
                -- Calculate negatives (two's compliment each integer)
                when triSetup_negate => -- nAX = -i0.x
                    nv0_x <= -v0_x;
                    nv0_y <= -v0_y;
                    nv1_x <= -v1_x;
                    nv1_y <= -v1_y;
                    nv2_x <= -v2_x;
                    nv2_y <= -v2_y;
                    currentState <= triSetup_leftInner0;
                    
                -- Calculate inner parenthesis terms for cross-product to calculate rowResetBarycentrics (one signed addition per cycle)
                -- rowResetA = (i2.x + nBX) * nBY + (nCY + i1.y) * i1.x
                -- rowResetB = (i0.x + nCX) * nCY + (nAY + i2.y) * i2.x
                -- rowResetC = (i1.x + nAX) * nAY + (nBY + i0.y) * i0.x
                when triSetup_leftInner0 =>
                    leftInner0 <= resize(v2_x, leftInner0'length) + resize(nv1_x, leftInner0'length);
                    currentState <= triSetup_leftInner1;
                when triSetup_leftInner1 =>
                    leftInner1 <= resize(v0_x, leftInner1'length) + resize(nv2_x, leftInner1'length);
                    currentState <= triSetup_leftInner2;
                when triSetup_leftInner2 =>
                    leftInner2 <= resize(v1_x, leftInner2'length) + resize(nv0_x, leftInner2'length);
                    currentState <= triSetup_rightInner0;
                when triSetup_rightInner0 =>
                    rightInner0 <= resize(v1_y, rightInner0'length) + resize(nv2_y, rightInner0'length);
                    currentState <= triSetup_rightInner1;
                when triSetup_rightInner1 =>
                    rightInner1 <= resize(v2_y, rightInner1'length) + resize(nv0_y, rightInner1'length);
                    currentState <= triSetup_rightInner2;
                when triSetup_rightInner2 =>
                    rightInner2 <= resize(v0_y, rightInner2'length) + resize(nv1_y, rightInner2'length);
                    currentState <= triSetup_leftProduct0;
                    
                -- 12-bit signed integer multiplication to 23 bit signed integer product (we're starting one signed multiplication per cycle)
                when triSetup_leftProduct0 =>
                    leftProduct0 <= leftInner0 * nv1_y;
                    currentState <= triSetup_leftProduct1;
                when triSetup_leftProduct1 =>
                    leftProduct1 <= leftInner1 * nv2_y;
                    currentState <= triSetup_leftProduct2;
                when triSetup_leftProduct2 =>
                    leftProduct2 <= leftInner2 * nv0_y;
                    currentState <= triSetup_rightProduct0;
                when triSetup_rightProduct0 =>
                    rightProduct0 <= rightInner0 * nv1_x;
                    currentState <= triSetup_rightProduct1;
                when triSetup_rightProduct1 =>
                    rightProduct1 <= rightInner1 * nv2_x;
                    currentState <= triSetup_rightProduct2;
                when triSetup_rightProduct2 =>
                    rightProduct2 <= rightInner2 * nv0_x;
                    currentState <= triSetup_crossProductSumA;
                    
                -- Finish the cross-product sum that yields the final row-reset barycentric values (signed integer addition - one per cycle)
                when triSetup_crossProductSumA =>
                    barycentricRowResetA <= std_logic_vector(resize(leftProduct0 + rightProduct0, barycentricRowResetA'length) );
                    currentState <= triSetup_crossProductSumB;
                when triSetup_crossProductSumB =>
                    barycentricRowResetB <= std_logic_vector(resize(leftProduct1 + rightProduct1, barycentricRowResetB'length) );
                    currentState <= triSetup_crossProductSumC;
                when triSetup_crossProductSumC =>
                    barycentricRowResetC <= std_logic_vector(resize(leftProduct2 + rightProduct2, barycentricRowResetC'length) );
                    currentState <= triSetup_applyTopLeftRule;
                when triSetup_applyTopLeftRule =>
                    barycentricRowResetA <= applyTopLeftRuleBarycentricAdjustment(barycentricRowResetA, isTopLeftEdgeA);
                    barycentricRowResetB <= applyTopLeftRuleBarycentricAdjustment(barycentricRowResetB, isTopLeftEdgeB);
                    barycentricRowResetC <= applyTopLeftRuleBarycentricAdjustment(barycentricRowResetC, isTopLeftEdgeC);
                    currentState <= triSetup_broadcastOutput;
                when triSetup_broadcastOutput =>
                    if (readyForTriSetupData = '1') then
                        outMinX <= std_logic_vector(minX);
                        outMaxX <= std_logic_vector(maxX);
                        outMinY <= std_logic_vector(minY);
                        outMaxY <= std_logic_vector(maxY);
                        outInitialBarycentricRowResetA <= barycentricRowResetA;
                        outInitialBarycentricRowResetB <= barycentricRowResetB;
                        outInitialBarycentricRowResetC <= barycentricRowResetC;
                        outIsTopLeftEdgeA <= isTopLeftEdgeA;
                        outIsTopLeftEdgeB <= isTopLeftEdgeB;
                        outIsTopLeftEdgeC <= isTopLeftEdgeC;
                        outBarycentricXDeltaA <= barycentricXDeltaA;
                        outBarycentricXDeltaB <= barycentricXDeltaB;
                        outBarycentricXDeltaC <= barycentricXDeltaC;
                        outBarycentricYDeltaA <= barycentricYDeltaA;
                        outBarycentricYDeltaB <= barycentricYDeltaB;
                        outBarycentricYDeltaC <= barycentricYDeltaC;
                        v0_out_invZ <= v0_store_invZ;
                        v1_out_invZ <= v1_store_invZ;
                        v2_out_invZ <= v2_store_invZ;
                        t0_out_x <= t0_store_x;
                        t0_out_y <= t0_store_y;
                        t1_out_x <= t1_store_x;
                        t1_out_y <= t1_store_y;
                        t2_out_x <= t2_store_x;
                        t2_out_y <= t2_store_y;
                        outBarycentricInverse <= std_logic_vector(barycentricInverse);
                        stats_totalTrianglesPassed <= stats_totalTrianglesPassed + 1;
                        triSetupDataIsValid <= '1';        
                        readyForNextTriSig <= '1';           
                        currentState <= triSetup_waitForTriData;
                    end if;
            end case;
        end if;
    end process;


end Behavioral;
