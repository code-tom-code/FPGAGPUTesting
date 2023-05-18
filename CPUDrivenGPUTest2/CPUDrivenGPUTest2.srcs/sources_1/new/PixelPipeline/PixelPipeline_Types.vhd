
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
		SetNewPrimSlot, -- 0
		TerminateCurrentPrimSlot, -- 1
		SetNewDrawEventID, -- 2
		TerminateCurrentDrawEventID, -- 3
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
		TX0 : f32; -- 63 : 32
		TX10 : f32; -- 95 : 64
		TX20 : f32; -- 127 : 96
		TY0 : f32; -- 159 : 128
		TY10 : f32; -- 191 : 160
		TY20 : f32; -- 223 : 192
		VC0 : unsigned(127 downto 0); -- 351 : 224
		VC10 : unsigned(127 downto 0); -- 479 : 352
		VC20 : unsigned(127 downto 0); -- 607 : 480
		NormalizedBarycentricB : f32; -- 639 : 608
		NormalizedBarycentricC : f32; -- 671 : 640
		InterpolatedPixelW : f32; -- 703 : 672
	end record sInterpolatorData;

	constant INTERPOLATOR_DATA_BITS : positive := 704;

	pure function SerializeAttributeData(inStruct : sInterpolatorData) return std_logic_vector;
	pure function DeserializeAttributeData(inBits : std_logic_vector(INTERPOLATOR_DATA_BITS-1 downto 0) ) return sInterpolatorData;
	pure function MakeStructFromMembers(aPosX : unsigned(15 downto 0); aPosY : unsigned(15 downto 0);
		aTX0 : f32; aTX10 : f32; aTX20 : f32;
		aTY0 : f32; aTY10 : f32; aTY20 : f32;
		aVC0 : unsigned(127 downto 0); aVC10 : unsigned(127 downto 0); aVC20 : unsigned(127 downto 0);
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
		& std_logic_vector(inStruct.VC20)
		& std_logic_vector(inStruct.VC10)
		& std_logic_vector(inStruct.VC0)
		& std_logic_vector(inStruct.TY20)
		& std_logic_vector(inStruct.TY10)
		& std_logic_vector(inStruct.TY0)
		& std_logic_vector(inStruct.TX20)
		& std_logic_vector(inStruct.TX10)
		& std_logic_vector(inStruct.TX0)
		& std_logic_vector(inStruct.PosY)
		& std_logic_vector(inStruct.PosX);
	end function;

	pure function DeserializeAttributeData(inBits : std_logic_vector(INTERPOLATOR_DATA_BITS-1 downto 0) ) return sInterpolatorData is
		variable ret : sInterpolatorData;
	begin
		ret.PosX := unsigned(inBits(15 downto 0) );
		ret.PosY := unsigned(inBits(31 downto 16) );
		ret.TX0 := f32(inBits(63 downto 32) );
		ret.TX10 := f32(inBits(95 downto 64) );
		ret.TX20 := f32(inBits(127 downto 96) );
		ret.TY0 := f32(inBits(159 downto 128) );
		ret.TY10 := f32(inBits(191 downto 160) );
		ret.TY20 := f32(inBits(223 downto 192) );
		ret.VC0 := unsigned(inBits(351 downto 224) );
		ret.VC10 := unsigned(inBits(479 downto 352) );
		ret.VC20 := unsigned(inBits(607 downto 480) );
		ret.NormalizedBarycentricB := f32(inBits(639 downto 608) );
		ret.NormalizedBarycentricC := f32(inBits(671 downto 640) );
		ret.InterpolatedPixelW := f32(inBits(703 downto 672) );

		return ret;
	end function;

	pure function MakeStructFromMembers(aPosX : unsigned(15 downto 0); aPosY : unsigned(15 downto 0);
		aTX0 : f32; aTX10 : f32; aTX20 : f32;
		aTY0 : f32; aTY10 : f32; aTY20 : f32;
		aVC0 : unsigned(127 downto 0); aVC10 : unsigned(127 downto 0); aVC20 : unsigned(127 downto 0);
		aNormalizedBarycentricB : f32; aNormalizedBarycentricC : f32;
		aInterpolatedPixelW : f32) return sInterpolatorData is
		variable ret : sInterpolatorData;
	begin
		ret.PosX := aPosX;
		ret.PosY := aPosY;
		ret.TX0 := aTX0;
		ret.TX10 := aTX10;
		ret.TX20 := aTX20;
		ret.TY0 := aTY0;
		ret.TY10 := aTY10;
		ret.TY20 := aTY20;
		ret.VC0 := aVC0;
		ret.VC10 := aVC10;
		ret.VC20 := aVC20;
		ret.NormalizedBarycentricB := aNormalizedBarycentricB;
		ret.NormalizedBarycentricC := aNormalizedBarycentricC;
		ret.InterpolatedPixelW := aInterpolatedPixelW;

		return ret;
	end function;

end package body PixelPipeline_Types;
