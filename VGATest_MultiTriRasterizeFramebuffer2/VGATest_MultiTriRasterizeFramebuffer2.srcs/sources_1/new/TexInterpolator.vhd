library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TexInterpolator is
    generic (NumNewtonRaphsonIterations : integer := 5);
    Port ( clk : in STD_LOGIC;
           isFifoEmpty : in STD_LOGIC;
           inBarycentricInverse : in STD_LOGIC_VECTOR(15 downto 0);
           inBarycentricA : in STD_LOGIC_VECTOR(15 downto 0);
           inBarycentricB : in STD_LOGIC_VECTOR(15 downto 0);
           inBarycentricC : in STD_LOGIC_VECTOR(15 downto 0);
           inInvZ0 : in STD_LOGIC_VECTOR(23 downto 0);
           inInvZ1 : in STD_LOGIC_VECTOR(23 downto 0);
           inInvZ2 : in STD_LOGIC_VECTOR(23 downto 0);
           inT0X : in STD_LOGIC_VECTOR(15 downto 0);
           inT0Y : in STD_LOGIC_VECTOR(15 downto 0);
           inT1X : in STD_LOGIC_VECTOR(15 downto 0);
           inT1Y : in STD_LOGIC_VECTOR(15 downto 0);
           inT2X : in STD_LOGIC_VECTOR(15 downto 0);
           inT2Y : in STD_LOGIC_VECTOR(15 downto 0);
           pixelX : in STD_LOGIC_VECTOR(9 downto 0);
           pixelY : in STD_LOGIC_VECTOR(9 downto 0);
           noperspective : in STD_LOGIC;
           readFromFifo : out STD_LOGIC;
           outInterpolatedTexcoordX : out STD_LOGIC_VECTOR(15 downto 0);
           outInterpolatedTexcoordY : out STD_LOGIC_VECTOR(15 downto 0);
           outPixelX : out STD_LOGIC_VECTOR(9 downto 0);
           outPixelY : out STD_LOGIC_VECTOR(9 downto 0);
           outPixelInterpolatedDepth : out STD_LOGIC_VECTOR(15 downto 0);
           inTXOffsetThisFrame : in STD_LOGIC_VECTOR(15 downto 0);
           writeIsValid : out STD_LOGIC;
           readyForWrite : in STD_LOGIC );
end TexInterpolator;

architecture Behavioral of TexInterpolator is

type stateType is 
(
    init,
    waitingForRead,
	reading,
	
	-- Used for noperspective attribute interpolation
    barycentricNormalization,
    barycentricNormalizationShift,
    barycentricTexcoord,
    barycentricTexcoord2,
    barycentricTexcoordShift,
    
    reciprocalZ_findFixedNormalizeFactor,
    reciprocalZ_normalizeFixedTwiceTriArea,
    reciprocalZ_x0Product,
    reciprocalZ_x0ProductShift,
    reciprocalZ_x0Difference,
    reciprocalZ_NewtonIter0_x1innerProduct,
    reciprocalZ_NewtonIter0_x1innerProductShift,
    reciprocalZ_NewtonIter0_x1difference,
    reciprocalZ_NewtonIter0_x1product,
    reciprocalZ_NewtonIter0_x1productShift,
    reciprocalZ_findUnnormalizedBarycentricInverse,
    
    -- Used for (more typical) perspective-correct attribute interpolation
    invertTexcoords,
    
    waitingForWrite
);

signal currentState : stateType := init;

signal interpBitsX : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal interpBitsY : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
signal storedPixelX : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal storedPixelY : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

signal tempMultBarycentricA : unsigned(31 downto 0) := (others => '0');
signal tempMultBarycentricB : unsigned(31 downto 0) := (others => '0');
signal tempMultBarycentricC : unsigned(31 downto 0) := (others => '0');
signal normalizedBarycentricA : unsigned(15 downto 0) := (others => '0');
signal normalizedBarycentricB : unsigned(15 downto 0) := (others => '0');
signal normalizedBarycentricC : unsigned(15 downto 0) := (others => '0');

-- These numbers are the product of two 17-bit multiplicands in 1.16 unsigned fixed-point format
signal tempMulBarycentricTexcoord0X : unsigned(33 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord0Y : unsigned(33 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord1X : unsigned(33 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord1Y : unsigned(33 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord2X : unsigned(33 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord2Y : unsigned(33 downto 0) := (others => '0');

signal tempInvZDP3A : unsigned(33 downto 0) := (others => '0');
signal tempInvZDP3B : unsigned(33 downto 0) := (others => '0');
signal tempInvZDP3C : unsigned(33 downto 0) := (others => '0');
signal interpolatedInversePixelDepth : unsigned(33 downto 0) := (others => '0');
signal interpolatedTexcoordX : unsigned(33 downto 0) := (others => '0');
signal interpolatedTexcoordY : unsigned(33 downto 0) := (others => '0');

constant initialGuessScale : unsigned(16 downto 0) := to_unsigned(123361, 17); -- +1.8823529411764705882352941176471dec = +1.e1e1hex = 123361dec as uint32
constant initialGuessBias : unsigned(17 downto 0) := to_unsigned(185042, 18); -- +2.8235294117647058823529411764706dec = +2.d2d2hex = 185042dec as uint32
constant iterationSubtractTwo : unsigned(17 downto 0) := to_unsigned(131072, 18); -- +2.0 = +2.0000 hex = 131072dec as uint32
signal rcpZ_normalizeFactor : unsigned(4 downto 0) := (others => '0');
signal rcpZ_normalizedTwiceTriangleArea : unsigned(15 downto 0) := (others => '0'); -- Q0.16, value between (0.5, 1.0)
signal unshifted_x0product : unsigned(32 downto 0) := (others => '0');
signal x0product : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value between (16/17, 32/17) or (0.941176, 1.882353)
signal x0result : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value between (16/17, 32/17) or (0.941176, 1.882353) (same range as x0product)
signal newtonIterCount : unsigned(2 downto 0) := (others => '0'); -- Counts from 0 to 5 and then resets
signal unshifted_x1innerProduct : unsigned(32 downto 0) := (others => '0');
signal x1innerProduct : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value range for first iteration between (8/17, 32/17) or (0.470588, 1.882353)
signal x1difference : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value range for first iteration between (2/17, 26/17) or (0.117647, 1.529411)
signal unshifted_x1 : unsigned(33 downto 0) := (others => '0');
signal x1 : unsigned(16 downto 0) := (others => '0'); -- Q1.16, value range for first iteration between (0.110727, 2.878891) (don't worry this never actually goes over 1.9 in practice so it'll fit into a Q1.16)
signal pixelDepth : unsigned(15 downto 0) := (others => '0');
    
    -- Assumes value is nonzero
    pure function bitScan(value : unsigned(15 downto 0) ) return unsigned is
    begin
        assert value > 0;
        for bitIndex in 0 to 15 loop
            if (value(15 - bitIndex) = '1') then
                return to_unsigned(15 - bitIndex + 1, 5);
            end if;
        end loop;
        return to_unsigned(0, 5);
    end function;

begin

    process(clk)
        variable tempBarycentricTexcoordShiftAX : unsigned(33 downto 0) := (others => '0');
        variable tempBarycentricTexcoordShiftAY : unsigned(33 downto 0) := (others => '0');
        variable tempBarycentricTexcoordShiftBX : unsigned(33 downto 0) := (others => '0');
        variable tempBarycentricTexcoordShiftBY : unsigned(33 downto 0) := (others => '0');
        variable tempBarycentricTexcoordShiftCX : unsigned(33 downto 0) := (others => '0');
        variable tempBarycentricTexcoordShiftCY : unsigned(33 downto 0) := (others => '0');
        variable tempCombine : unsigned(16 downto 0) := (others => '0');
        variable bitshiftTemporary : unsigned(33 downto 0) := (others => '0');
        variable productShiftTemporary : unsigned(32 downto 0) := (others => '0');
        variable bigProductTemporary : unsigned(33 downto 0) := (others => '0');
        variable subtractTemporary : unsigned(17 downto 0) := (others => '0');
        variable bitshift2Temporary : unsigned(16 downto 0) := (others => '0');
    begin
        if (rising_edge(clk) ) then
            case currentState is
                when init =>
                    readFromFifo <= '0';
                    writeIsValid <= '0';
                    currentState <= waitingForRead;
                when waitingForRead =>
                    writeIsValid <= '0';
                    if (isFifoEmpty = '0') then
                        readFromFifo <= '1'; -- Signal the read request
						currentState <= reading;
                    end if;
				when reading =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					currentState <= barycentricNormalization;
                when barycentricNormalization =>
					storedPixelX <= pixelX;
					storedPixelY <= pixelY;
                    tempMultBarycentricA <= unsigned(inBarycentricA) * unsigned(inBarycentricInverse);
                    tempMultBarycentricB <= unsigned(inBarycentricB) * unsigned(inBarycentricInverse);
                    tempMultBarycentricC <= unsigned(inBarycentricC) * unsigned(inBarycentricInverse);
                    currentState <= barycentricNormalizationShift;                    
                when barycentricNormalizationShift =>
                    normalizedBarycentricA <= tempMultBarycentricA(15 downto 0);
                    normalizedBarycentricB <= tempMultBarycentricB(15 downto 0);
                    normalizedBarycentricC <= tempMultBarycentricC(15 downto 0);
                    currentState <= barycentricTexcoord;
                when barycentricTexcoord =>
                    tempInvZDP3A <= '0' & normalizedBarycentricA * unsigned('1' & inInvZ0(23 downto 8) );
                    tempInvZDP3B <= '0' & normalizedBarycentricB * unsigned('1' & inInvZ1(23 downto 8) );
                    tempInvZDP3C <= '0' & normalizedBarycentricC * unsigned('1' & inInvZ2(23 downto 8) );
                    currentState <= barycentricTexcoord2;
                when barycentricTexcoord2 =>
                    bigProductTemporary := tempInvZDP3A srl 17; 
                    tempCombine := bigProductTemporary(16 downto 0);
                    tempMulBarycentricTexcoord0X <= (tempCombine) * unsigned('0' & inT0X);
                    tempMulBarycentricTexcoord0Y <= (tempCombine) * unsigned('0' & inT0Y);
                    
                    bigProductTemporary := tempInvZDP3B srl 17;
                    tempCombine := bigProductTemporary(16 downto 0);
                    tempMulBarycentricTexcoord1X <= (tempCombine) * unsigned('0' & inT1X);
                    tempMulBarycentricTexcoord1Y <= (tempCombine) * unsigned('0' & inT1Y);
                    
                    bigProductTemporary := tempInvZDP3C srl 17;
                    tempCombine := bigProductTemporary(16 downto 0);
                    tempMulBarycentricTexcoord2X <= (tempCombine) * unsigned('0' & inT2X);
                    tempMulBarycentricTexcoord2Y <= (tempCombine) * unsigned('0' & inT2Y);
                    currentState <= barycentricTexcoordShift;                    
                when barycentricTexcoordShift =>
                    -- Add the three products to compelte the dot-product
                    interpolatedInversePixelDepth <= tempInvZDP3A + tempInvZDP3B + tempInvZDP3C;
                    
                    interpolatedTexcoordX <= tempMulBarycentricTexcoord0X + tempMulBarycentricTexcoord1X + tempMulBarycentricTexcoord2X;
                    interpolatedTexcoordY <= tempMulBarycentricTexcoord0Y + tempMulBarycentricTexcoord1Y + tempMulBarycentricTexcoord2Y;
                    currentState <= reciprocalZ_findFixedNormalizeFactor;
                when reciprocalZ_findFixedNormalizeFactor =>
                    --rcpZ_normalizeFactor <= bitScan(unsigned(interpolatedInversePixelDepth(31 downto 16) ) );
                    
                    -- We need to normalize the value into the (0.5 to 1.0) range
                    rcpZ_normalizeFactor <= to_unsigned(1, 5); -- Since we know that we used barycentric interpolation on three vaules that were all (1.0 + X), the result
                    -- must also be of the form (1.0 + x), so we know that the first bit is 1.
                    currentState <= reciprocalZ_normalizeFixedTwiceTriArea;
                when reciprocalZ_normalizeFixedTwiceTriArea =>
                    --bitshiftTemporary := (unsigned(interpolatedInversePixelDepth(31 downto 16) ) & "0000000000000000") srl to_integer(rcpZ_normalizeFactor);
                    --rcpZ_normalizedTwiceTriangleArea <= bitshiftTemporary(15 downto 0);
                    bitshiftTemporary := interpolatedInversePixelDepth srl to_integer(rcpZ_normalizeFactor);
                    rcpZ_normalizedTwiceTriangleArea <= bitshiftTemporary(31 downto 16);
                    currentState <= reciprocalZ_x0Product;
                when reciprocalZ_x0Product =>
                    unshifted_x0product <= rcpZ_normalizedTwiceTriangleArea * initialGuessScale;
                    currentState <= reciprocalZ_x0ProductShift;
                when reciprocalZ_x0ProductShift =>
                    productShiftTemporary := unshifted_x0product srl 16; 
                    x0product <= productShiftTemporary(16 downto 0);
                    currentState <= reciprocalZ_x0Difference;
                when reciprocalZ_x0Difference =>
                    subtractTemporary := initialGuessBias - x0product; 
                    x0result <= subtractTemporary(16 downto 0);
                    newtonIterCount <= "000";
                    currentState <= reciprocalZ_NewtonIter0_x1innerProduct;
                when reciprocalZ_NewtonIter0_x1innerProduct =>
                    unshifted_x1innerProduct <= rcpZ_normalizedTwiceTriangleArea * x0result;
                    currentState <= reciprocalZ_NewtonIter0_x1innerProductShift;
                when reciprocalZ_NewtonIter0_x1innerProductShift =>
                    productShiftTemporary := unshifted_x1innerProduct srl 16;
                    x1innerProduct <= productShiftTemporary(16 downto 0);
                    currentState <= reciprocalZ_NewtonIter0_x1difference;
                when reciprocalZ_NewtonIter0_x1difference =>
                    subtractTemporary := iterationSubtractTwo - x1innerProduct;
                    x1difference <= subtractTemporary(16 downto 0);
                    currentState <= reciprocalZ_NewtonIter0_x1product;
                when reciprocalZ_NewtonIter0_x1product =>
                    unshifted_x1 <= x0result * x1difference;
                    currentState <= reciprocalZ_NewtonIter0_x1productShift;
                when reciprocalZ_NewtonIter0_x1productShift =>
                    bigProductTemporary := unshifted_x1 srl 16;
                    x1 <= bigProductTemporary(16 downto 0);
                    if ( (newtonIterCount < (NumNewtonRaphsonIterations - 1) ) and
                        bigProductTemporary(16 downto 0) /= x0result) then
                        newtonIterCount <= newtonIterCount + 1;
                        x0result <= bigProductTemporary(16 downto 0);
                        currentState <= reciprocalZ_NewtonIter0_x1innerProduct;
                    else
                        currentState <= reciprocalZ_findUnnormalizedBarycentricInverse;
                    end if;
                when reciprocalZ_findUnnormalizedBarycentricInverse =>
                    --bitshift2Temporary := x1 srl to_integer(rcpZ_normalizeFactor);
                    --pixelDepth <= bitshift2Temporary(15 downto 0);
                    bitshift2Temporary := x1 srl to_integer(rcpZ_normalizeFactor);
                    pixelDepth <= bitshift2Temporary(15 downto 0);
                    currentState <= invertTexcoords;
                when invertTexcoords =>
                    interpolatedTexcoordX <= interpolatedTexcoordX(33 downto 17) * ('0' & pixelDepth);
                    interpolatedTexcoordY <= interpolatedTexcoordY(33 downto 17) * ('0' & pixelDepth);
                    currentState <= waitingForWrite;
                when waitingForWrite =>
                    if (readyForWrite = '1') then
                        writeIsValid <= '1'; -- Strobe the write request
                        
                        -- TODO: Figure out why this is SRL 14 instead of SRL 17...
                        -- Magic number shift by 3 is no good, but it makes it work!
                        tempBarycentricTexcoordShiftAX := (interpolatedTexcoordX srl 14);
                        tempBarycentricTexcoordShiftAX := tempBarycentricTexcoordShiftAX + unsigned(inTXOffsetThisFrame);
                        tempBarycentricTexcoordShiftAY := interpolatedTexcoordY srl 14;
                        outInterpolatedTexcoordX <= std_logic_vector(tempBarycentricTexcoordShiftAX(15 downto 0) );
                        outInterpolatedTexcoordY <= std_logic_vector(tempBarycentricTexcoordShiftAY(15 downto 0) );
                        outPixelInterpolatedDepth <= std_logic_vector(pixelDepth);
                        outPixelX <= storedPixelX;
                        outPixelY <= storedPixelY;
                        currentState <= waitingForRead;
                    end if;
            end case;
        end if;
    end process;

end Behavioral;
