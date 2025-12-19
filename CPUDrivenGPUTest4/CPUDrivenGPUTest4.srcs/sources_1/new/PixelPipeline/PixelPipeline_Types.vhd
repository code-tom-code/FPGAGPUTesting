
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.FloatALU_Types.all; -- For the f32 type

package PixelPipeline_Types is

	type eSpecialPixelCodeBits is
	(
		SetNewPrimSlot, -- 0 (Shows up as 0x8001)
		TerminateCurrentPrimSlot, -- 1 (Shows up as 0x8002)
		SetNewDrawEventID, -- 2 (Shows up as 0x8004)
		TerminateCurrentDrawEventID, -- 3 (Shows up as 0x8008)
		Unused4, -- 4
		Unused5, -- 5
		Unused6, -- 6
		Unused7, -- 7
		Unused8, -- 8
		Unused9, -- 9
		Unused10, -- 10
		Unused11, -- 11
		Unused12, -- 12
		Unused13, -- 13
		Unused14, -- 14
		SpecialCodeBit -- 15
	);

	constant PixelMsg_SetNewPrimSlot : unsigned(15 downto 0) := X"8001";
	constant PixelMsg_TermCurrentPrimSlot : unsigned(15 downto 0) := X"8002";
	constant PixelMsg_SetNewDrawEventID : unsigned(15 downto 0) := X"8004";
	constant PixelMsg_TermCurrentDrawEventID : unsigned(15 downto 0) := X"8008";

	pure function IsSpecialPixelMessage(pixelCoord : unsigned(15 downto 0) ) return boolean;

	type sInterpolatorData is record
		PosX : unsigned(15 downto 0); -- 15 : 0
		PosY : unsigned(15 downto 0); -- 31 : 16
		NormalizedBarycentricB : f32; -- 63 : 32
		NormalizedBarycentricC : f32; -- 95 : 64
		InterpolatedPixelW : f32; -- 127 : 96
	end record sInterpolatorData;

	constant INTERPOLATOR_DATA_BITS : positive := 128;

	pure function SerializeAttributeData(inStruct : sInterpolatorData) return std_logic_vector;
	pure function DeserializeAttributeData(inBits : std_logic_vector(INTERPOLATOR_DATA_BITS-1 downto 0) ) return sInterpolatorData;
	pure function MakeStructFromMembers(aPosX : unsigned(15 downto 0); aPosY : unsigned(15 downto 0);
		aNormalizedBarycentricB : f32; aNormalizedBarycentricC : f32;
		aInterpolatedPixelW : f32) return sInterpolatorData;
	
end package PixelPipeline_Types;

package body PixelPipeline_Types is

	pure function IsSpecialPixelMessage(pixelCoord : unsigned(15 downto 0) ) return boolean is
	begin
		return pixelCoord(eSpecialPixelCodeBits'pos(SpecialCodeBit) ) = '1';
	end function;

	pure function SerializeAttributeData(inStruct : sInterpolatorData) return std_logic_vector is
	begin
		return std_logic_vector(inStruct.InterpolatedPixelW)
		& std_logic_vector(inStruct.NormalizedBarycentricC)
		& std_logic_vector(inStruct.NormalizedBarycentricB)
		& std_logic_vector(inStruct.PosY)
		& std_logic_vector(inStruct.PosX);
	end function;

	pure function DeserializeAttributeData(inBits : std_logic_vector(INTERPOLATOR_DATA_BITS-1 downto 0) ) return sInterpolatorData is
		variable ret : sInterpolatorData;
	begin
		ret.PosX := unsigned(inBits(15 downto 0) );
		ret.PosY := unsigned(inBits(31 downto 16) );
		ret.NormalizedBarycentricB := f32(inBits(63 downto 32) );
		ret.NormalizedBarycentricC := f32(inBits(95 downto 64) );
		ret.InterpolatedPixelW := f32(inBits(127 downto 96) );

		return ret;
	end function;

	pure function MakeStructFromMembers(aPosX : unsigned(15 downto 0); aPosY : unsigned(15 downto 0);
		aNormalizedBarycentricB : f32; aNormalizedBarycentricC : f32;
		aInterpolatedPixelW : f32) return sInterpolatorData is
		variable ret : sInterpolatorData;
	begin
		ret.PosX := aPosX;
		ret.PosY := aPosY;
		ret.NormalizedBarycentricB := aNormalizedBarycentricB;
		ret.NormalizedBarycentricC := aNormalizedBarycentricC;
		ret.InterpolatedPixelW := aInterpolatedPixelW;

		return ret;
	end function;

end package body PixelPipeline_Types;
