
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

package ClipTypes is

	subtype ClipPlaneIndex is natural range 0 to 10;

	subtype VertexAllClipCodes is std_logic_vector(10 downto 0);

	-- These are the clip planes ordered in the order that we want to clip them in from first to last:
	type ClipPlaneEnum is
	(
		ClipPlaneW0,
		ClipPlaneZNear,
		ClipPlaneZFar,
		ClipPlaneRight,
		ClipPlaneLeft,
		ClipPlaneTop,
		ClipPlaneBottom,
		ClipPlaneRightGB,
		ClipPlaneLeftGB,
		ClipPlaneTopGB,
		ClipPlaneBottomGB,
		ClipDone
	);

	type ClipAxisCategoryEnum is
	(
		ClipAxisOutsideLess,
		ClipAxisInside,
		ClipAxisOutsideGreater
	);
	
end package ClipTypes;

package body ClipTypes is

end package body ClipTypes;
