
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

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
	
end package PixelPipeline_Types;

package body PixelPipeline_Types is

	pure function IsSpecialPixelMessage(pixelCoord : unsigned(15 downto 0) ) return boolean is
	begin
		return pixelCoord(eSpecialPixelCodeBits'pos(SpecialCodeBit) ) = '1';
	end function;

end package body PixelPipeline_Types;
