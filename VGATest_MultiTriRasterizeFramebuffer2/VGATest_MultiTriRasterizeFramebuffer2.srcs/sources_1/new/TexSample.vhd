library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.EarthTextureData.ALL;

entity TexSample is
    Port ( clk : in STD_LOGIC;
           writeStrobe : in STD_LOGIC; -- Strobed high for one cycle, then back to low after that
           readyForNewWrite : out STD_LOGIC;
           pixelX : in STD_LOGIC_VECTOR(9 downto 0);
           pixelY : in STD_LOGIC_VECTOR(9 downto 0);
           useBilinearInterpolation : in STD_LOGIC;
           inInterpolatedTexcoordX : in STD_LOGIC_VECTOR(15 downto 0);
           inInterpolatedTexcoordY : in STD_LOGIC_VECTOR(15 downto 0);
           outPixelX : out STD_LOGIC_VECTOR(9 downto 0);
           outPixelY : out STD_LOGIC_VECTOR(9 downto 0);
           outR : out STD_LOGIC_VECTOR(7 downto 0);
           outG : out STD_LOGIC_VECTOR(7 downto 0);
           outB : out STD_LOGIC_VECTOR(7 downto 0);
           writeIsValid : out STD_LOGIC;
           writeAck : in STD_LOGIC );
end TexSample;

architecture Behavioral of TexSample is

-- Bit data imported from a 256x128 texture
signal rom_bits_red : earth_tex_rom_bits_t := rom_bits_data_red;
signal rom_bits_green : earth_tex_rom_bits_t := rom_bits_data_green;
signal rom_bits_blue : earth_tex_rom_bits_t := rom_bits_data_blue;
	
attribute ROM_STYLE : string;
attribute ROM_STYLE of rom_bits_red: signal is "BLOCK";
attribute ROM_STYLE of rom_bits_green: signal is "BLOCK";
attribute ROM_STYLE of rom_bits_blue: signal is "BLOCK";

type stateType is 
(
    init,
    waitingForRead,
    
    -- Tex sample entry points (one for point-sampling and the other for bilinear)
    texSample_point,
    texSample_bilinear,
    
    -- These stages are used for bilinear interpolation only
    bilinear_xMinMax,
    bilinear_xDelta,
    bilinear_xMultiply,
    bilinear_xCombine,
    bilinear_yMinMax,
    bilinear_yDelta,
    bilinear_yMultiply,
    bilinear_yCombine,
    
    -- These latter stages are once again shared by both point and bilinear sampling:
    setupOutput,
    waitingForWrite
);

signal currentState : stateType := init;

signal texX : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal texY : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
signal interpBitsX : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal interpBitsY : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal storedPixelX : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal storedPixelY : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
signal outColorRegR : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal outColorRegG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal outColorRegB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

type RGBVec3 is record
    R : unsigned(7 downto 0);
    G : unsigned(7 downto 0);
    B : unsigned(7 downto 0);
end record RGBVec3;

type interpVec3 is record
    X : unsigned(7 downto 0);
    Y : unsigned(7 downto 0);
    Z : unsigned(7 downto 0);
end record interpVec3;

type mulTemporary3 is record
    X : unsigned(15 downto 0);
    Y : unsigned(15 downto 0);
    Z : unsigned(15 downto 0);
end record mulTemporary3;

signal TL : RGBVec3;
signal TR : RGBVec3;
signal BL : RGBVec3;
signal BR : RGBVec3;

signal deltaT : RGBVec3;
signal deltaB : RGBVec3;
signal deltaY : RGBVec3;
signal lerpedT : RGBVec3;
signal lerpedB : RGBVec3;
signal interpXT : interpVec3;
signal interpXB : interpVec3;
signal interpY : interpVec3;
signal lerpDirectionT : STD_LOGIC_VECTOR(2 downto 0); -- Bool-vector of a.RGB < b.RGB
signal lerpDirectionB : STD_LOGIC_VECTOR(2 downto 0); -- Bool-vector of a.RGB < b.RGB
signal lerpDirectionY : STD_LOGIC_VECTOR(2 downto 0); -- Bool-vector of a.RGB < b.RGB
signal mulTemporaryT : mulTemporary3;
signal mulTemporaryB : mulTemporary3;
signal mulTemporaryY : mulTemporary3;

    pure function minBits(aVec : RGBVec3;
                          bVec : RGBVec3 ) return std_logic_vector is
        variable ret : std_logic_vector(2 downto 0);
    begin
        if (aVec.R < bVec.R) then
            ret(0) := '1';
        else
            ret(0) := '0';
        end if;
        if (aVec.G < bVec.G) then
            ret(1) := '1';
        else
            ret(1) := '0';
        end if;
        if (aVec.B < bVec.B) then
            ret(2) := '1';
        else
            ret(2) := '0';
        end if;
        return ret;
    end function;
    
    pure function assembleMin(aVec : RGBVec3;
                              bVec : RGBVec3;
                              minBits : STD_LOGIC_VECTOR(2 downto 0) ) return RGBVec3 is
        variable ret : RGBVec3;
    begin
        if (minBits(0) = '1') then
            ret.R := aVec.R;
        else
            ret.R := bVec.R;
        end if;
        if (minBits(1) = '1') then
            ret.G := aVec.G;
        else
            ret.G := bVec.G;
        end if;
        if (minBits(2) = '1') then
            ret.B := aVec.B;
        else
            ret.B := bVec.B;
        end if;
        return ret;
    end function;
    
    pure function assembleMax(aVec : RGBVec3;
                              bVec : RGBVec3;
                              minBits : STD_LOGIC_VECTOR(2 downto 0) ) return RGBVec3 is
        variable ret : RGBVec3;
    begin
        if (minBits(0) = '1') then
            ret.R := bVec.R;
        else
            ret.R := aVec.R;
        end if;
        if (minBits(1) = '1') then
            ret.G := bVec.G;
        else
            ret.G := aVec.G;
        end if;
        if (minBits(2) = '1') then
            ret.B := bVec.B;
        else
            ret.B := aVec.B;
        end if;
        return ret;
    end function;
    
    pure function assembleInterpVec(interpBits : unsigned(7 downto 0);
                                    directionBits : STD_LOGIC_VECTOR(2 downto 0) ) return interpVec3 is
        variable ret : interpVec3;
        variable oneMinusInterpBits : unsigned(7 downto 0);
    begin
        oneMinusInterpBits := to_unsigned(255, 8) - interpBits;
        if (directionBits(0) = '1') then
            ret.X := interpBits;
        else
            ret.X := oneMinusInterpBits;
        end if;
        if (directionBits(1) = '1') then
            ret.Y := interpBits;
        else
            ret.Y := oneMinusInterpBits;
        end if;
        if (directionBits(2) = '1') then
            ret.Z := interpBits;
        else
            ret.Z := oneMinusInterpBits;
        end if;
        return ret;
    end function;

begin

    process(clk)
        variable tempR : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
        variable tempG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
        variable tempB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
        variable tempRowR : STD_LOGIC_VECTOR(2047 downto 0) := (others => '0');
        variable tempRowG : STD_LOGIC_VECTOR(2047 downto 0) := (others => '0');
        variable tempRowB : STD_LOGIC_VECTOR(2047 downto 0) := (others => '0');
        variable tempRowR2 : STD_LOGIC_VECTOR(2047 downto 0) := (others => '0');
        variable tempRowG2 : STD_LOGIC_VECTOR(2047 downto 0) := (others => '0');
        variable tempRowB2 : STD_LOGIC_VECTOR(2047 downto 0) := (others => '0');
        variable minT : RGBVec3;
        variable minB : RGBVec3;
        variable minY : RGBVec3;
        variable minVertical : RGBVec3;
        variable maxT : RGBVec3;
        variable maxB : RGBVec3;
        variable maxY : RGBVec3;
        variable maxVertical : RGBVec3;
        variable tempCombine : unsigned(15 downto 0) := (others => '0');
    begin
        if (rising_edge(clk) ) then
            case currentState is
                when init =>
                    writeIsValid <= '0';
                    outPixelX <= (others => '0');
                    outPixelY <= (others => '0');
                    outR <= (others => '0');
                    outG <= (others => '0');
                    outB <= (others => '0');
                    readyForNewWrite <= '1';
                    currentState <= waitingForRead;
                when waitingForRead =>
                    if (writeStrobe = '1') then
                        readyForNewWrite <= '0';
                        texX <= std_logic_vector(inInterpolatedTexcoordX(15 downto 8) );
                        interpBitsX <= std_logic_vector(inInterpolatedTexcoordX(7 downto 0) );
                        texY <= std_logic_vector(inInterpolatedTexcoordY(15 downto 9) );
                        interpBitsY <= std_logic_vector(inInterpolatedTexcoordY(8 downto 1) );
                        storedPixelX <= pixelX;
                        storedPixelY <= pixelY;
                        
                        if (useBilinearInterpolation = '0') then
                            currentState <= texSample_point;
                        else
                            currentState <= texSample_bilinear;
                        end if;
                    end if;
                    
                when texSample_point =>
                    tempRowR := rom_bits_red(to_integer(unsigned(texY) ) );
                    tempRowG := rom_bits_green(to_integer(unsigned(texY) ) );
                    tempRowB := rom_bits_blue(to_integer(unsigned(texY) ) );
                    for x in 0 to 7 loop
                        tempR(x) := tempRowR( to_integer(unsigned(texX) * 8 + x) );
                        tempG(x) := tempRowG( to_integer(unsigned(texX) * 8 + x) );
                        tempB(x) := tempRowB( to_integer(unsigned(texX) * 8 + x) );
                    end loop;
                    
                    outColorRegR <= tempR;
                    outColorRegG <= tempG;
                    outColorRegB <= tempB;
                    currentState <= setupOutput;
                    
                when texSample_bilinear =>                    
                    -- Bilinear interpolation needs to do more samples...
                    tempRowR := rom_bits_red(to_integer(unsigned(texY) ) );
                    tempRowG := rom_bits_green(to_integer(unsigned(texY) ) );
                    tempRowB := rom_bits_blue(to_integer(unsigned(texY) ) );
                    tempRowR2 := rom_bits_red(to_integer(unsigned(texY) + 1) );
                    tempRowG2 := rom_bits_green(to_integer(unsigned(texY) + 1) );
                    tempRowB2 := rom_bits_blue(to_integer(unsigned(texY) + 1) );
                    for x in 0 to 7 loop
                        tempR(x) := tempRowR( to_integer(unsigned(texX) * 8 + x) );
                        tempG(x) := tempRowG( to_integer(unsigned(texX) * 8 + x) );
                        tempB(x) := tempRowB( to_integer(unsigned(texX) * 8 + x) );
                    end loop;                                        
                    TL.R <= unsigned(tempR);
                    TL.G <= unsigned(tempG);
                    TL.B <= unsigned(tempB);
                    for x in 0 to 7 loop
                        tempR(x) := tempRowR( to_integer( (unsigned(texX) + 1) * 8 + x) );
                        tempG(x) := tempRowG( to_integer( (unsigned(texX) + 1) * 8 + x) );
                        tempB(x) := tempRowB( to_integer( (unsigned(texX) + 1) * 8 + x) );
                    end loop;
                    TR.R <= unsigned(tempR);
                    TR.G <= unsigned(tempG);
                    TR.B <= unsigned(tempB);
                    for x in 0 to 7 loop
                        tempR(x) := tempRowR2( to_integer(unsigned(texX) * 8 + x) );
                        tempG(x) := tempRowG2( to_integer(unsigned(texX) * 8 + x) );
                        tempB(x) := tempRowB2( to_integer(unsigned(texX) * 8 + x) );
                    end loop;
                    BL.R <= unsigned(tempR);
                    BL.G <= unsigned(tempG);
                    BL.B <= unsigned(tempB);
                    for x in 0 to 7 loop
                        tempR(x) := tempRowR2( to_integer( (unsigned(texX) + 1) * 8 + x) );
                        tempG(x) := tempRowG2( to_integer( (unsigned(texX) + 1) * 8 + x) );
                        tempB(x) := tempRowB2( to_integer( (unsigned(texX) + 1) * 8 + x) );
                    end loop;
                    BR.R <= unsigned(tempR);
                    BR.G <= unsigned(tempG);
                    BR.B <= unsigned(tempB);
                    
                    currentState <= bilinear_xMinMax;
                when bilinear_xMinMax =>
                    lerpDirectionT <= minBits(TL, TR);
                    lerpDirectionB <= minBits(BL, BR);
                    currentState <= bilinear_xDelta;
                when bilinear_xDelta =>
                    minT := assembleMin(TL, TR, lerpDirectionT);
                    minB := assembleMin(BL, BR, lerpDirectionB);
                    maxT := assembleMax(TL, TR, lerpDirectionT);
                    maxB := assembleMax(BL, BR, lerpDirectionB);
                    interpXT <= assembleInterpVec(unsigned(interpBitsX), lerpDirectionT);
                    interpXB <= assembleInterpVec(unsigned(interpBitsX), lerpDirectionB);
                    deltaT.R <= maxT.R - minT.R;
                    deltaT.G <= maxT.G - minT.G;
                    deltaT.B <= maxT.B - minT.B;
                    deltaB.R <= maxB.R - minB.R;
                    deltaB.G <= maxB.G - minB.G;
                    deltaB.B <= maxB.B - minB.B;
                    currentState <= bilinear_xMultiply;
                when bilinear_xMultiply =>
                    mulTemporaryT.X <= deltaT.R * interpXT.X;
                    mulTemporaryT.Y <= deltaT.G * interpXT.Y;
                    mulTemporaryT.Z <= deltaT.B * interpXT.Z;
                    mulTemporaryB.X <= deltaB.R * interpXB.X;
                    mulTemporaryB.Y <= deltaB.G * interpXB.Y;
                    mulTemporaryB.Z <= deltaB.B * interpXB.Z;
                    currentState <= bilinear_xCombine;
                when bilinear_xCombine =>
                    tempCombine := minT.R + (mulTemporaryT.X srl 8);
                    lerpedT.R <= tempCombine(7 downto 0);
                    tempCombine := minT.G + (mulTemporaryT.Y srl 8);
                    lerpedT.G <= tempCombine(7 downto 0);
                    tempCombine := minT.B + (mulTemporaryT.Z srl 8);
                    lerpedT.B <= tempCombine(7 downto 0);
                    tempCombine := minB.R + (mulTemporaryB.X srl 8);
                    lerpedB.R <= tempCombine(7 downto 0);
                    tempCombine := minB.G + (mulTemporaryB.Y srl 8);
                    lerpedB.G <= tempCombine(7 downto 0);
                    tempCombine := minB.B + (mulTemporaryB.Z srl 8);
                    lerpedB.B <= tempCombine(7 downto 0);
                    currentState <= bilinear_yMinMax;
                when bilinear_yMinMax =>
                    lerpDirectionY <= minBits(lerpedT, lerpedB);
                    currentState <= bilinear_yDelta;
                when bilinear_yDelta =>
                    minY := assembleMin(lerpedT, lerpedB, lerpDirectionY);
                    maxY := assembleMax(lerpedT, lerpedB, lerpDirectionY);
                    interpY <= assembleInterpVec(unsigned(interpBitsY), lerpDirectionY);
                    deltaY.R <= maxY.R - minY.R;
                    deltaY.G <= maxY.G - minY.G;
                    deltaY.B <= maxY.B - minY.B;
                    currentState <= bilinear_yMultiply;
                when bilinear_yMultiply =>
                    mulTemporaryY.X <= deltaY.R * interpY.X;
                    mulTemporaryY.Y <= deltaY.G * interpY.Y;
                    mulTemporaryY.Z <= deltaY.B * interpY.Z;
                    currentState <= bilinear_yCombine;
                when bilinear_yCombine =>
                    tempCombine := minY.R + (mulTemporaryY.X srl 8);
                    outColorRegR <= std_logic_vector(tempCombine(7 downto 0) ); 
                    
                    tempCombine := minY.G + (mulTemporaryY.Y srl 8);
                    outColorRegG <= std_logic_vector(tempCombine(7 downto 0) );
                    
                    tempCombine := minY.B + (mulTemporaryY.Z srl 8);
                    outColorRegB <= std_logic_vector(tempCombine(7 downto 0) );
                    
                    currentState <= setupOutput;
                    
                -- These latter stages are once again shared by both point and bilinear sampling:
                when setupOutput =>
                    outPixelX <= storedPixelX;
                    outPixelY <= storedPixelY;
                    
                    -- Color output:
                    outR <= outColorRegR;
                    outG <= outColorRegG;
                    outB <= outColorRegB;
                    
                    -- Bilinear interpolants output (debugging):
                    --outR <= interpBitsX;
                    --outG <= interpBitsY(7 downto 0);
                    --outB <= "00000000";
                    
                    -- Texcoord output (debugging):
                    --outR <= texX;
                    --outG <= '0' & texY;
                    --outB <= "00000000";
                    
                    writeIsValid <= '1'; -- Signal the write request                    
                    currentState <= waitingForWrite;
                when waitingForWrite =>
                    if (writeAck = '1') then
                        writeIsValid <= '0';
                        readyForNewWrite <= '1';
                        currentState <= waitingForRead;
                    end if;
            end case;
        end if;
    end process;

end Behavioral;
