library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.FloatCommon.all;
use work.ClipTypes.all;
use work.ClipCommon.all;

entity AABB2DOverlapViewport is
	Port (
	-- Triangle data in
		inv0x : in STD_LOGIC_VECTOR(31 downto 0);
		inv0y : in STD_LOGIC_VECTOR(31 downto 0);

		inv1x : in STD_LOGIC_VECTOR(31 downto 0);
		inv1y : in STD_LOGIC_VECTOR(31 downto 0);

		inv2x : in STD_LOGIC_VECTOR(31 downto 0);
		inv2y : in STD_LOGIC_VECTOR(31 downto 0);
	-- End Triangle data in

	-- Intersection test signal out
		outWholeTriangleAABBIntersectsViewport : out STD_LOGIC := '0'
	-- End intersection test signal out
		);
end AABB2DOverlapViewport;

architecture Behavioral of AABB2DOverlapViewport is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	pure function OverlapViewportTestAxis(axisMin : f32; axisMax : f32) return std_logic is
	begin
		-- return (axisMin <= 1.0f && axisMax >= -1.0f)
		if (FloatLessThanFloat(axisMin, X"3F800001") and FloatGreaterThanFloat(axisMax, X"BF800001") ) then
			return '1';
		else
			return '0';
		end if;
	end function;

	pure function OverlapViewportTest(xMin : f32; xMax : f32; yMin : f32; yMax : f32) return std_logic is
	begin
		-- return (xMin <= 1.0f && xMax >= -1.0f && yMin <= 1.0f && yMax >= -1.0f)
		return OverlapViewportTestAxis(xMin, xMax) and OverlapViewportTestAxis(yMin, yMax);
	end function;

	pure function AABB2DGetMinMaxAxis(axisPos0 : f32; axisPos1 : f32; axisPos2 : f32) return unsigned is
		variable axisMins : std_logic_vector(2 downto 0);
	begin
		if (FloatLessThanFloat(axisPos0, axisPos1) ) then
			axisMins(0) := '1';
		else
			axisMins(0) := '0';
		end if;
		if (FloatLessThanFloat(axisPos1, axisPos2) ) then
			axisMins(1) := '1';
		else
			axisMins(1) := '0';
		end if;
		if (FloatLessThanFloat(axisPos0, axisPos2) ) then
			axisMins(2) := '1';
		else
			axisMins(2) := '0';
		end if;

		case axisMins is
			when "000" => -- x2 < x1 < x0
				return axisPos0 & axisPos2;
			when "001" => -- x1 < x0 < x2
				return axisPos2 & axisPos1;
			when "010" => -- x1 < x2 < x0
				return axisPos0 & axisPos1;
			when "011" => -- x1 < x0 < x2
				return axisPos2 & axisPos1;
			when "100" => -- x2 < x0 < x1
				return axisPos1 & axisPos2;
			when "101" => -- x0 < x2 < x1
				return axisPos1 & axisPos0;
			--when "110" => -- x0 < x1=x2? This case looks broken. Dunno if it's even possible to get here.
			when others => --when "111" => -- x0 < x1 < x2
				return axisPos2 & axisPos0;
		end case;

	end function;

	pure function AABB2DOverlapViewportFunc(vx0 : f32; vy0 : f32; vx1 : f32; vy1 : f32; vx2 : f32; vy2 : f32) return std_logic is
		variable combinedXMinMax : unsigned(63 downto 0);
		variable combinedYMinMax : unsigned(63 downto 0);
	begin

		--combinedXMinMax := AABB2DGetMinMaxAxis(vx0, vx1, vx2);
		--combinedYMinMax := AABB2DGetMinMaxAxis(vy0, vy1, vy2);

		--return OverlapViewportTest(f32(combinedXMinMax(31 downto 0) ), f32(combinedXMinMax(63 downto 32) ), 
			--f32(combinedYMinMax(31 downto 0) ), f32(combinedYMinMax(63 downto 32) ) );
		return '1';
	end function;

begin

outWholeTriangleAABBIntersectsViewport <= AABB2DOverlapViewportFunc(f32(inv0x), f32(inv0y), f32(inv1x), f32(inv1y), f32(inv2x), f32(inv2y) );

end Behavioral;
