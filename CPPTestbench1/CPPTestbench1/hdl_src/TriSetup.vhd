library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;

entity TriSetup is
	Port ( clk : in STD_LOGIC;

	-- Input Assembler interfaces begin
		IA_v0_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v0_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v0_in_invZ : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v0_in_invW : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v1_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v1_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v1_in_invZ : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v1_in_invW : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v2_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v2_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v2_in_invZ : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v2_in_invW : in STD_LOGIC_VECTOR(31 downto 0);
		IA_t0_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_t0_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_t1_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_t1_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_t2_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_t2_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_v0_in_RGBA : in STD_LOGIC_VECTOR(127 downto 0);
		IA_v1_in_RGBA : in STD_LOGIC_VECTOR(127 downto 0);
		IA_v2_in_RGBA : in STD_LOGIC_VECTOR(127 downto 0);

		IA_newTriBegin : in STD_LOGIC;
		IA_readyForNewTri : out STD_LOGIC := '0';
	-- Input Assembler interfaces end

	-- TexConfig interfaces begin
		TEXCFG_nointerpolation : in STD_LOGIC; -- Means that none of the vertex attributes need to be interpolated (so we can skip a ton of steps)
	-- TexConfig interfaces end

	-- Rasterizer interfaces begin
		RAST_outBarycentricInverse : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- This is a floating point value
		RAST_v0_out_invZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_v10_out_invZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_v20_out_invZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_v0_out_invW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_v10_out_invW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_v20_out_invW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_t0_out_x : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_t0_out_y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_t10_out_x : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_t10_out_y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_t20_out_x : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_t20_out_y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_v0_out_colorRGBA : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		RAST_v10_out_colorRGBA : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		RAST_v20_out_colorRGBA : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');

		RAST_outMinX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outMaxX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outMinY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outMaxY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outInitialBarycentricRowResetA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_outInitialBarycentricRowResetB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_outInitialBarycentricRowResetC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_outIsTopLeftEdgeA : out STD_LOGIC := '0';
		RAST_outIsTopLeftEdgeB : out STD_LOGIC := '0';
		RAST_outIsTopLeftEdgeC : out STD_LOGIC := '0';
		RAST_outBarycentricXDeltaA : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outBarycentricXDeltaB : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outBarycentricXDeltaC : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outBarycentricYDeltaA : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outBarycentricYDeltaB : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		RAST_outBarycentricYDeltaC : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		RAST_readyForTriSetupData : in STD_LOGIC;
		RAST_triSetupDataIsValid : out STD_LOGIC := '0';
	-- Rasterizer interfaces end

	-- FPU interfaces begin
		FPU_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_ISHFT_GO : out STD_LOGIC := '0';
		FPU_IMUL_GO : out STD_LOGIC := '0';
		FPU_IADD_GO : out STD_LOGIC := '0';
		FPU_ICMP_GO : out STD_LOGIC := '0';
		FPU_ICNV_GO : out STD_LOGIC := '0';
		FPU_ISPEC_GO : out STD_LOGIC := '0';
		FPU_IBIT_GO : out STD_LOGIC := '0';
		FPU_OUT : in STD_LOGIC_VECTOR(31 downto 0);
	-- FPU interfaces end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_TriSetup_State : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		DBG_MinX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MaxX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MinY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MaxY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_XProdSub0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_XProdSub1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_XProdSub2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_XProdSub3 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_XProdProd0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_XProdProd1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_TwiceTriArea : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end TriSetup;

architecture Behavioral of TriSetup is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

	type state_t is (
		triSetup_waitForTriData, -- 0

		-- Initial vertex value culling (NaN/INF/Zero invW cause the triangle to be culled)
		triSetup_NAN_INF_ZeroW_Cull, -- 1
		triSetup_zVertexCull, -- 2

		-- Converting the float32 x/y coordinates to fixed-point integers
		triSetup_QuantizeSnapToGridX0, -- 3
		triSetup_QuantizeSnapToGridX1, -- 4
		triSetup_QuantizeSnapToGridX2, -- 5
		triSetup_QuantizeSnapToGridY0, -- 6
		triSetup_QuantizeSnapToGridY1, -- 7
		triSetup_QuantizeSnapToGridY2, -- 8
		triSetup_QuantizeSnapToGridWait0, -- 9
		triSetup_QuantizeSnapToGridWait1, -- 10
		triSetup_QuantizeSnapToGridWait2, -- 11
		triSetup_QuantizeSnapToGridWait3, -- 12

		triSetup_duplicateVertexCull, -- 13

		-- Bounds calculations and trivial rejection culling:
		triSetup_bounds, -- 14
		triSetup_boundsClamp, -- 15
		triSetup_boundsCull, -- 16

		-- Compute cross-product to get (signed) twiceTriangleArea
		triSetup_crossProduct, -- 17
		triSetup_crossProduct2, -- 18
		triSetup_crossProduct4, -- 19

		-- Backface cull (cull if twiceTriangleArea <= 0)
		triSetup_backfaceCull, -- 20

		-- Send data to reciprocal unit
		triSetup_sendToRecip, -- 21
		triSetup_waitForConvert0, -- 22
		triSetup_waitForConvert1, -- 23
		triSetup_waitForConvert2, -- 24
		triSetup_setupRecip, -- 25

		-- Compute top-left edge rule offsets
		triSetup_topLeftBiasA, -- 26

		-- Compute barycentric deltas
		triSetup_barycentricXDeltaA, -- 27

		-- Compute barycentric values
		triSetup_leftInner0, -- 28
		triSetup_leftProduct0, -- 29
		triSetup_crossProductSumA, -- 30
		triSetup_applyTopLeftRule, --31

		triSetup_waitForReciprocalResult, -- 32

		-- Compute 10 and 20 delta values for each of our interpolated components:
		triSetup_calculateTX10Delta, -- 33
		triSetup_calculateTX20Delta, -- 34
		triSetup_calculateTY10Delta, -- 35
		triSetup_calculateTY20Delta, -- 36
		triSetup_calculateColorR10Delta, -- 37
		triSetup_calculateColorR20Delta, -- 38
		triSetup_calculateColorG10Delta, -- 39
		triSetup_calculateColorG20Delta, -- 40
		triSetup_calculateColorB10Delta, -- 41
		triSetup_calculateColorB20Delta, -- 42
		triSetup_calculateColorA10Delta, -- 43
		triSetup_calculateColorA20Delta, -- 44
		triSetup_calculateInvZ10Delta, -- 45
		triSetup_calculateInvZ20Delta, -- 46
		triSetup_calculateInvW10Delta, -- 47
		triSetup_calculateInvW20Delta, -- 48
		triSetup_waitForDeltasCompletion0, -- 49
		triSetup_waitForDeltasCompletion1, -- 50
		triSetup_waitForDeltasCompletion2, -- 51
		triSetup_waitForDeltasCompletion3, -- 52
		triSetup_waitForDeltasCompletion4, -- 53

		-- Finally, send our setup tri result data to the rasterizer
		triSetup_broadcastOutput -- 54
		);

	pure function isTopLeftEdge(vertA_X : signed(15 downto 0); 
		vertA_Y : signed(15 downto 0); 
		vertB_X : signed(15 downto 0); 
		vertB_Y : signed(15 downto 0) ) return std_logic is
		variable dx : signed(15 downto 0);
		variable dy : signed(15 downto 0);
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

	pure function boundsMin(a : signed(15 downto 0);
							b : signed(15 downto 0);
							c : signed(15 downto 0) ) return signed is
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

	pure function boundsMax(a : signed(15 downto 0);
							b : signed(15 downto 0);
							c : signed(15 downto 0) ) return signed is
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

	pure function applyTopLeftRuleBarycentricAdjustment(barycentricCoord : SIGNED(31 downto 0);
														isTopLeftEdge : STD_LOGIC ) return SIGNED is
	begin
		if (isTopLeftEdge = '1') then
			return barycentricCoord;
		else
			return barycentricCoord - 1;
		end if;
	end function;

	pure function IsFloatNANorINF(floatVal : unsigned(31 downto 0) ) return boolean is
	begin
		return (floatVal(30 downto 23) = "11111111"); -- Our float is INF or NAN if the exponent bits are set to all 1's
	end function;

	pure function IsDenormal(floatVal : unsigned(31 downto 0) ) return boolean is
	begin
		return (floatVal(30 downto 23) = "00000000"); -- Our float is denormal (including zero) if the exponent bits are set to all 0's
	end function;

	-- Simply flip the sign bit:
	pure function NegateFloat(inVal : unsigned(31 downto 0) ) return unsigned is
	begin
		return (not inVal(31) ) & (inVal(30 downto 0) );
	end function;

	-- Should we cull this whole triangle because one of the vertices has a bad (NAN, INF, or denormal invW) position value?
	pure function ShouldCullTriBadVertex(xPos : unsigned(31 downto 0); yPos : unsigned(31 downto 0); invZ : unsigned(31 downto 0); invW : unsigned(31 downto 0) ) return boolean is
	begin
		return (IsFloatNANorINF(xPos) or IsFloatNANorINF(yPos) or IsFloatNANorINF(invZ) or IsFloatNANorINF(invW) or IsDenormal(invW) );
	end function;

	constant oneF : unsigned(30 downto 0) := "0111111100000000000000000000000"; -- This is 0x3f800000 with the top (sign) bit cut off

	-- Returns true if vertex is out of bounds, or false if the vertex is in-bounds:
	pure function IsZOutOfBounds(vertexInvZValue : unsigned(31 downto 0) ) return boolean is
	begin
		if (vertexInvZValue(31) = '1') then -- Negative Z values are behind the camera, so return true
			return true;
		elsif (vertexInvZValue(30 downto 0) < oneF) then -- Inverse-Z values less than 1.0f must be from Z-values greater than 1.0f
			return true;
		else
			return false;
		end if;
	end function;

-- External store signals
signal v0_store_invZ : unsigned(31 downto 0) := (others => '0');
signal v0_store_invW : unsigned(31 downto 0) := (others => '0');
signal v1_store_invZ : unsigned(31 downto 0) := (others => '0');
signal v1_store_invW : unsigned(31 downto 0) := (others => '0');
signal v2_store_invZ : unsigned(31 downto 0) := (others => '0');
signal v2_store_invW : unsigned(31 downto 0) := (others => '0');
signal t0_store_x : unsigned(31 downto 0) := (others => '0');
signal t0_store_y : unsigned(31 downto 0) := (others => '0');
signal t1_store_x : unsigned(31 downto 0) := (others => '0');
signal t1_store_y : unsigned(31 downto 0) := (others => '0');
signal t2_store_x : unsigned(31 downto 0) := (others => '0');
signal t2_store_y : unsigned(31 downto 0) := (others => '0');
signal v0_store_RGBA : unsigned(127 downto 0) := (others => '0');
signal v1_store_RGBA : unsigned(127 downto 0) := (others => '0');
signal v2_store_RGBA : unsigned(127 downto 0) := (others => '0');

-- Internal signals
signal readyForNextTriSig : STD_LOGIC := '1';
signal currentState : state_t := triSetup_waitForTriData;

-- Internal computation intermediaries
signal v0_xPosFloat : unsigned(31 downto 0) := (others => '0'); -- 32-bit floating point
signal v1_xPosFloat : unsigned(31 downto 0) := (others => '0');
signal v2_xPosFloat : unsigned(31 downto 0) := (others => '0');
signal v0_yPosFloat : unsigned(31 downto 0) := (others => '0');
signal v1_yPosFloat : unsigned(31 downto 0) := (others => '0');
signal v2_yPosFloat : unsigned(31 downto 0) := (others => '0');

signal v0_x : signed(15 downto 0) := to_signed(320, 16); -- 16 bit signed integer
signal v0_y : signed(15 downto 0) := to_signed(120, 16);
signal v1_x : signed(15 downto 0) := to_signed(480, 16);
signal v1_y : signed(15 downto 0) := to_signed(360, 16);
signal v2_x : signed(15 downto 0) := to_signed(160, 16);
signal v2_y : signed(15 downto 0) := to_signed(240, 16);

signal nv0_x : signed(15 downto 0) := (others => '0'); -- 16 bit signed integer
signal nv0_y : signed(15 downto 0) := (others => '0');
signal nv1_x : signed(15 downto 0) := (others => '0');
signal nv1_y : signed(15 downto 0) := (others => '0');
signal nv2_x : signed(15 downto 0) := (others => '0');
signal nv2_y : signed(15 downto 0) := (others => '0');

signal minX : signed(15 downto 0) := (others => '0'); -- Triangle AABB clipped to screenspace (x is 0 to 639, y is 0 to 479)
signal minY : signed(15 downto 0) := (others => '0');
signal maxX : signed(15 downto 0) := (others => '0');
signal maxY : signed(15 downto 0) := (others => '0');

signal crossProdSub0 : signed(15 downto 0) := (others => '0'); -- Cross product temporaries
signal crossProdSub1 : signed(15 downto 0) := (others => '0');
signal crossProdSub2 : signed(15 downto 0) := (others => '0');
signal crossProdSub3 : signed(15 downto 0) := (others => '0');
signal crossProdProd0 : signed(31 downto 0) := (others => '0');
signal crossProdProd1 : signed(31 downto 0) := (others => '0');

signal leftFirstTermInner0 : signed(15 downto 0) := (others => '0'); -- 16 bit signed integer
signal leftFirstTermInner1 : signed(15 downto 0) := (others => '0');
signal leftFirstTermInner2 : signed(15 downto 0) := (others => '0');

signal rightFirstTermInner0 : signed(15 downto 0) := (others => '0'); -- 16 bit signed integer
signal rightFirstTermInner1 : signed(15 downto 0) := (others => '0');
signal rightFirstTermInner2 : signed(15 downto 0) := (others => '0');

signal leftSecondTermInner0 : signed(15 downto 0) := (others => '0'); -- 16 bit signed integer
signal leftSecondTermInner1 : signed(15 downto 0) := (others => '0');
signal leftSecondTermInner2 : signed(15 downto 0) := (others => '0');

signal rightSecondTermInner0 : signed(15 downto 0) := (others => '0'); -- 16 bit signed integer
signal rightSecondTermInner1 : signed(15 downto 0) := (others => '0');
signal rightSecondTermInner2 : signed(15 downto 0) := (others => '0');

signal leftProduct0 : signed(31 downto 0) := (others => '0'); -- 32 bit signed integer
signal leftProduct1 : signed(31 downto 0) := (others => '0');
signal leftProduct2 : signed(31 downto 0) := (others => '0');

signal rightProduct0 : signed(31 downto 0) := (others => '0'); -- 32 bit signed integer
signal rightProduct1 : signed(31 downto 0) := (others => '0');
signal rightProduct2 : signed(31 downto 0) := (others => '0');

signal isTopLeftEdgeA : STD_LOGIC := '0';
signal isTopLeftEdgeB : STD_LOGIC := '0';
signal isTopLeftEdgeC : STD_LOGIC := '0';

-- Note that the triangle does get backface-culled in the case that this is a negative or zero value
signal twiceTriangleArea : signed(31 downto 0) := (others => '0'); -- This must be signed so we can test if it's negative or not
signal twiceTriangleAreaFloat : unsigned(31 downto 0) := (others => '0'); -- This is the floating-point representation of twiceTriangleArea (after the uint32 to float conversion)
signal reciprocalCycleCounter : unsigned(3 downto 0) := (others => '0'); -- Keeps track of how many cycles we have remaining in our reciprocal calculation

signal barycentricInverse : unsigned(31 downto 0) := (others => '0'); -- float32 value that is calculated as (1.0f / twiceTriangleArea) using the FPU reciprocal unit

signal barycentricRowResetA : signed(31 downto 0) := (others => '0');
signal barycentricRowResetB : signed(31 downto 0) := (others => '0');
signal barycentricRowResetC : signed(31 downto 0) := (others => '0');

signal barycentricXDeltaA : signed(15 downto 0) := to_signed(131, 16);
signal barycentricXDeltaB : signed(15 downto 0) := to_signed(131, 16);
signal barycentricXDeltaC : signed(15 downto 0) := to_signed(-262, 16);

signal barycentricYDeltaA : signed(15 downto 0) := to_signed(-400, 16);
signal barycentricYDeltaB : signed(15 downto 0) := to_signed(200, 16);
signal barycentricYDeltaC : signed(15 downto 0) := to_signed(200, 16);

signal stats_totalTrianglesINF_NAN_ZeroWVertCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesDuplicateVertCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesZeroAreaBoundsCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesZeroAreaTriCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesBackfaceCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesZCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesPassed : unsigned(11 downto 0) := (others => '0');

signal triSetupDataIsValid : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

-- Tie off all of the FPU signals that we aren't going to use to zero:
FPU_ISHFT_GO <= '0';
FPU_IMUL_GO <= '0';
FPU_ICMP_GO <= '0';
FPU_IBIT_GO <= '0';

RAST_triSetupDataIsValid <= triSetupDataIsValid;
IA_readyForNewTri <= readyForNextTriSig;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_TriSetup_State <= std_logic_vector(to_unsigned(state_t'pos(currentState), 6) );
DBG_MinX <= std_logic_vector(minX);
DBG_MaxX <= std_logic_vector(maxX);
DBG_MinY <= std_logic_vector(minY);
DBG_MaxY <= std_logic_vector(maxY);
DBG_XProdSub0 <= std_logic_vector(crossProdSub0);
DBG_XProdSub1 <= std_logic_vector(crossProdSub1);
DBG_XProdSub2 <= std_logic_vector(crossProdSub2);
DBG_XProdSub3 <= std_logic_vector(crossProdSub3);
DBG_XProdProd0 <= std_logic_vector(crossProdProd0);
DBG_XProdProd1 <= std_logic_vector(crossProdProd1);
DBG_TwiceTriArea <= std_logic_vector(twiceTriangleArea);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when triSetup_waitForTriData =>
					statCyclesIdle <= statCyclesIdle + 1;

				when triSetup_broadcastOutput =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then                        
			case currentState is
				-- Load new triangle data
				when triSetup_waitForTriData =>
					triSetupDataIsValid <= '0';
					if (IA_newTriBegin = '1' and readyForNextTriSig = '1') then
						v0_xPosFloat <= unsigned(IA_v0_in_x);
						v0_yPosFloat <= unsigned(IA_v0_in_y);
						v1_xPosFloat <= unsigned(IA_v1_in_x);
						v1_yPosFloat <= unsigned(IA_v1_in_y);
						v2_xPosFloat <= unsigned(IA_v2_in_x);
						v2_yPosFloat <= unsigned(IA_v2_in_y);
						v0_store_invZ <= unsigned(IA_v0_in_invZ);
						v0_store_invW <= unsigned(IA_v0_in_invW);
						v1_store_invZ <= unsigned(IA_v1_in_invZ);
						v1_store_invW <= unsigned(IA_v1_in_invW);
						v2_store_invZ <= unsigned(IA_v2_in_invZ);
						v2_store_invW <= unsigned(IA_v2_in_invW);
						t0_store_x <= unsigned(IA_t0_in_x);
						t0_store_y <= unsigned(IA_t0_in_y);
						t1_store_x <= unsigned(IA_t1_in_x);
						t1_store_y <= unsigned(IA_t1_in_y);
						t2_store_x <= unsigned(IA_t2_in_x);
						t2_store_y <= unsigned(IA_t2_in_y);
						v0_store_RGBA <= unsigned(IA_v0_in_RGBA);
						v1_store_RGBA <= unsigned(IA_v1_in_RGBA);
						v2_store_RGBA <= unsigned(IA_v2_in_RGBA);
						readyForNextTriSig <= '0';
						currentState <= triSetup_NAN_INF_ZeroW_Cull; -- Start the triangle setup state machine
					else
						readyForNextTriSig <= '1';
					end if;

				-- Triangle setup code

				when triSetup_NAN_INF_ZeroW_Cull =>
					if (ShouldCullTriBadVertex(v0_xPosFloat, v0_yPosFloat, v0_store_invZ, v0_store_invW) or	ShouldCullTriBadVertex(v1_xPosFloat, v1_yPosFloat, v1_store_invZ, v1_store_invW) or	ShouldCullTriBadVertex(v2_xPosFloat, v2_yPosFloat, v2_store_invZ, v2_store_invW) ) then
						stats_totalTrianglesINF_NAN_ZeroWVertCulled <= stats_totalTrianglesINF_NAN_ZeroWVertCulled + 1;
						readyForNextTriSig <= '1';
						currentState <= triSetup_waitForTriData;
					else
						currentState <= triSetup_zVertexCull;
					end if;

				-- TODO: Replace this with real triangle clipping that can create new triangles in the future
				when triSetup_zVertexCull =>
					if (IsZOutOfBounds(v0_store_invZ) or IsZOutOfBounds(v1_store_invZ) or IsZOutOfBounds(v2_store_invZ) ) then
						stats_totalTrianglesZCulled <= stats_totalTrianglesZCulled + 1;
						readyForNextTriSig <= '1';
						currentState <= triSetup_waitForTriData;
					else
						currentState <= triSetup_QuantizeSnapToGridX0;
					end if;

				when triSetup_QuantizeSnapToGridX0 =>
					FPU_A <= std_logic_vector(v0_xPosFloat);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_I16_RoundNearestEven), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= triSetup_QuantizeSnapToGridX1;

				when triSetup_QuantizeSnapToGridX1 =>
					FPU_A <= std_logic_vector(v1_xPosFloat);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_I16_RoundNearestEven), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= triSetup_QuantizeSnapToGridX2;

				when triSetup_QuantizeSnapToGridX2 =>
					FPU_A <= std_logic_vector(v2_xPosFloat);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_I16_RoundNearestEven), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= triSetup_QuantizeSnapToGridY0;

				when triSetup_QuantizeSnapToGridY0 =>
					FPU_A <= std_logic_vector(v0_yPosFloat);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_I16_RoundNearestEven), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= triSetup_QuantizeSnapToGridY1;

				when triSetup_QuantizeSnapToGridY1 =>
					FPU_A <= std_logic_vector(v1_yPosFloat);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_I16_RoundNearestEven), 3) );
					FPU_ICNV_GO <= '1';

					v0_x <= signed(FPU_OUT(15 downto 0) );
					currentState <= triSetup_QuantizeSnapToGridY2;

				when triSetup_QuantizeSnapToGridY2 =>
					FPU_A <= std_logic_vector(v2_yPosFloat);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_I16_RoundNearestEven), 3) );
					FPU_ICNV_GO <= '1';

					v1_x <= signed(FPU_OUT(15 downto 0) );
					currentState <= triSetup_QuantizeSnapToGridWait0;

				when triSetup_QuantizeSnapToGridWait0 =>
					FPU_ICNV_GO <= '0';

					v2_x <= signed(FPU_OUT(15 downto 0) );
					currentState <= triSetup_QuantizeSnapToGridWait1;

				when triSetup_QuantizeSnapToGridWait1 =>
					v0_y <= signed(FPU_OUT(15 downto 0) );
					currentState <= triSetup_QuantizeSnapToGridWait2;

				when triSetup_QuantizeSnapToGridWait2 =>
					v1_y <= signed(FPU_OUT(15 downto 0) );
					currentState <= triSetup_QuantizeSnapToGridWait3;

				when triSetup_QuantizeSnapToGridWait3 =>
					v2_y <= signed(FPU_OUT(15 downto 0) );
					currentState <= triSetup_duplicateVertexCull;

				when triSetup_duplicateVertexCull =>
					if ( ( (v0_x = v1_x) and (v0_y = v1_y) ) or -- v0 = v1
						( (v1_x = v2_x) and (v1_y = v2_y) ) or -- v1 = v2
						( (v0_x = v2_x) and (v0_y = v2_y) ) ) then -- v0 = v2
						stats_totalTrianglesDuplicateVertCulled <= stats_totalTrianglesDuplicateVertCulled + 1;
						readyForNextTriSig <= '1';
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
						minX <= to_signed(0, 16);
					end if;
					if (minY < 0) then
						minY <= to_signed(0, 16);
					end if;
					if (maxX > 639) then
						maxX <= to_signed(639, 16);
					end if;
					if (maxY > 479) then
						maxY <= to_signed(479, 16);
					end if;
					currentState <= triSetup_boundsCull;

				-- Cull zero-area triangles:
				when triSetup_boundsCull =>
					if ( (minX >= maxX) or (minY >= maxY) ) then
						stats_totalTrianglesZeroAreaBoundsCulled <= stats_totalTrianglesZeroAreaBoundsCulled + 1;
						readyForNextTriSig <= '1';
						currentState <= triSetup_waitForTriData;
					else
						currentState <= triSetup_crossProduct;
					end if;

				-- twiceTriangleArea = (i1.x - i0.x) * (i2.y - i0.y) - (i1.y - i0.y) * (i2.x - i0.x)
				-- twiceTriangleArea = sub0 * sub1 - sub2 * sub3
				-- twiceTriangleArea = prod0 - prod1
				when triSetup_crossProduct =>
					crossProdSub0 <= v1_x - v0_x; -- (i1.x - i0.x)
					crossProdSub1 <= v2_y - v0_y; -- (i2.y - i0.y)
					crossProdSub2 <= v1_y - v0_y; -- (i1.y - i0.y)
					crossProdSub3 <= v2_x - v0_x; -- (i2.x - i0.x)
					currentState <= triSetup_crossProduct2;

				when triSetup_crossProduct2 =>
					crossProdProd0 <= crossProdSub0 * crossProdSub1;
					crossProdProd1 <= crossProdSub2 * crossProdSub3;
					currentState <= triSetup_crossProduct4;

				when triSetup_crossProduct4 =>
					twiceTriangleArea <= crossProdProd0 - crossProdProd1;
					currentState <= triSetup_backfaceCull;

				-- Backface cull if the triangle has a negative area (facing away from the screen) or
				-- if it has zero area (too small)
				when triSetup_backfaceCull =>
					if (twiceTriangleArea(31) = '1') then -- Backface culling if we have a negative triangle area (topmost sign bit set)
						stats_totalTrianglesBackfaceCulled <= stats_totalTrianglesBackfaceCulled + 1;
						readyForNextTriSig <= '1';
						currentState <= triSetup_waitForTriData;
					elsif (twiceTriangleArea = 0) then -- Zero area culling
						stats_totalTrianglesZeroAreaTriCulled <= stats_totalTrianglesZeroAreaTriCulled + 1;
						readyForNextTriSig <= '1';
						currentState <= triSetup_waitForTriData;
					else
						if (TEXCFG_nointerpolation = '1') then
							currentState <= triSetup_topLeftBiasA;
						else
							currentState <= triSetup_sendToRecip;
						end if;
					end if;

				when triSetup_sendToRecip =>
					FPU_A <= std_logic_vector('0' & twiceTriangleArea(30 downto 0) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(U32_to_F), 3) );
					FPU_ICNV_GO <= '1'; -- Issue the uint32 -> float conversion on the FPU (takes 3 cycles to complete)
					currentState <= triSetup_waitForConvert0;

				when triSetup_waitForConvert0 =>
					FPU_ICNV_GO <= '0'; -- Deassert after one clock cycle
					currentState <= triSetup_waitForConvert1;

				when triSetup_waitForConvert1 =>
					currentState <= triSetup_waitForConvert2;

				when triSetup_waitForConvert2 =>
					currentState <= triSetup_setupRecip;

				when triSetup_setupRecip =>
					FPU_A <= FPU_OUT; -- Feed the results of the converted uint32 right back into the input again so we can take the reciprocal
					FPU_Mode <= (others => '0');
					FPU_ISPEC_GO <= '1'; -- Kick off the floating point reciprocal calculation (takes a whopping 14 cycles to complete)
					reciprocalCycleCounter <= to_unsigned(SPEC_CYCLES, 4);

					twiceTriangleAreaFloat <= unsigned(FPU_OUT);
					currentState <= triSetup_topLeftBiasA;

				when triSetup_topLeftBiasA =>
					FPU_ISPEC_GO <= '0'; -- Deassert after one clock cycle
					isTopLeftEdgeA <= isTopLeftEdge(v1_x, v1_y, v2_x, v2_y);
					isTopLeftEdgeB <= isTopLeftEdge(v2_x, v2_y, v0_x, v0_y);
					isTopLeftEdgeC <= isTopLeftEdge(v0_x, v0_y, v1_x, v1_y);
					reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					currentState <= triSetup_barycentricXDeltaA;

				-- Calculate barycentric X and Y deltas (one integer subtraction per cycle)
				when triSetup_barycentricXDeltaA =>
					barycentricXDeltaA <= v1_y - v2_y;
					barycentricXDeltaB <= v2_y - v0_y;
					barycentricXDeltaC <= v0_y - v1_y;
					barycentricYDeltaA <= v2_x - v1_x;
					barycentricYDeltaB <= v0_x - v2_x;
					barycentricYDeltaC <= v1_x - v0_x;

					-- Calculate negatives (two's compliment each integer)
					nv0_x <= -v0_x;
					nv0_y <= -v0_y;
					nv1_x <= -v1_x;
					nv1_y <= -v1_y;
					nv2_x <= -v2_x;
					nv2_y <= -v2_y;
					reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					currentState <= triSetup_leftInner0;

				-- Calculate inner parenthesis terms for cross-product to calculate rowResetBarycentrics (one signed addition per cycle)
				-- rowResetA = (i2.x - i1.x) * (yMin - i1.y) - (i2.y - i1.y) * (xMin - i1.x);
				-- = (i2.x + nBX) * (yMin + nBY) - (i2.y + nBY) * (xMin + nBX);
				-- rowResetB = (i0.x - i2.x) * (yMin - i2.y) - (i0.y - i2.y) * (xMin - i2.x);
				-- = (i0.x + nCX) * (yMin + nCY) - (i0.y + nCY) * (xMin + nCX);
				-- rowResetC = (i1.x - i0.x) * (yMin - i0.y) - (i1.y - i0.y) * (xMin - i0.x);
				-- = (i1.x + nAX) * (yMin + nAY) - (i1.y + nAY) * (xMin + nAX);
				when triSetup_leftInner0 =>
					leftFirstTermInner0 <= v2_x + nv1_x;
					leftFirstTermInner1 <= v0_x + nv2_x;
					leftFirstTermInner2 <= v1_x + nv0_x;

					leftSecondTermInner0 <= minY + nv1_y;
					leftSecondTermInner1 <= minY + nv2_y;
					leftSecondTermInner2 <= minY + nv0_y;

					rightFirstTermInner0 <= v2_y + nv1_y;
					rightFirstTermInner1 <= v0_y + nv2_y;
					rightFirstTermInner2 <= v1_y + nv0_y;

					rightSecondTermInner0 <= minX + nv1_x;
					rightSecondTermInner1 <= minX + nv2_x;
					rightSecondTermInner2 <= minX + nv0_x;

					reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					currentState <= triSetup_leftProduct0;

				-- 16-bit signed integer multiplication to 32 bit signed integer product (we're starting one signed multiplication per cycle)
				when triSetup_leftProduct0 =>
					leftProduct0 <= leftFirstTermInner0 * leftSecondTermInner0;
					leftProduct1 <= leftFirstTermInner1 * leftSecondTermInner1;
					leftProduct2 <= leftFirstTermInner2 * leftSecondTermInner2;
					rightProduct0 <= rightFirstTermInner0 * rightSecondTermInner0;
					rightProduct1 <= rightFirstTermInner1 * rightSecondTermInner1;
					rightProduct2 <= rightFirstTermInner2 * rightSecondTermInner2;
					reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					currentState <= triSetup_crossProductSumA;

				-- Finish the cross-product sum that yields the final row-reset barycentric values (signed integer addition - one per cycle)
				when triSetup_crossProductSumA =>
					barycentricRowResetA <= leftProduct0 - rightProduct0;
					barycentricRowResetB <= leftProduct1 - rightProduct1;
					barycentricRowResetC <= leftProduct2 - rightProduct2;
					reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					currentState <= triSetup_applyTopLeftRule;

				when triSetup_applyTopLeftRule =>
					barycentricRowResetA <= applyTopLeftRuleBarycentricAdjustment(barycentricRowResetA, isTopLeftEdgeA);
					barycentricRowResetB <= applyTopLeftRuleBarycentricAdjustment(barycentricRowResetB, isTopLeftEdgeB);
					barycentricRowResetC <= applyTopLeftRuleBarycentricAdjustment(barycentricRowResetC, isTopLeftEdgeC);
					reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					currentState <= triSetup_waitForReciprocalResult;

				when triSetup_waitForReciprocalResult =>
					if (reciprocalCycleCounter = 0) then
						barycentricInverse <= unsigned(FPU_OUT);
						currentState <= triSetup_calculateTX10Delta;
					else
						reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					end if;

				when triSetup_calculateTX10Delta => -- tx10 = tx1 - tx0
					FPU_A <= std_logic_vector(t1_store_x);
					FPU_B <= std_logic_vector(NegateFloat(t0_store_x) );
					FPU_IADD_GO <= '1';
					currentState <= triSetup_calculateTX20Delta;

				when triSetup_calculateTX20Delta => -- tx20 = tx2 - tx0
					FPU_A <= std_logic_vector(t2_store_x);
					FPU_IADD_GO <= '1';
					currentState <= triSetup_calculateTY10Delta;

				when triSetup_calculateTY10Delta => -- ty10 = ty1 - ty0
					FPU_A <= std_logic_vector(t1_store_y);
					FPU_B <= std_logic_vector(NegateFloat(t0_store_y) );
					FPU_IADD_GO <= '1';
					currentState <= triSetup_calculateTY20Delta;

				when triSetup_calculateTY20Delta => -- ty20 = ty2 - ty0
					FPU_A <= std_logic_vector(t2_store_y);
					FPU_IADD_GO <= '1';
					currentState <= triSetup_calculateColorR10Delta;

				when triSetup_calculateColorR10Delta => -- colorR10 = colorR1 - colorR0
					FPU_A <= std_logic_vector(v1_store_RGBA(31 downto 0) );
					FPU_B <= std_logic_vector(NegateFloat(v0_store_RGBA(31 downto 0) ) );
					FPU_IADD_GO <= '1';
					currentState <= triSetup_calculateColorR20Delta;

				when triSetup_calculateColorR20Delta => -- colorR20 = colorR2 - colorR0
					FPU_A <= std_logic_vector(v2_store_RGBA(31 downto 0) );
					FPU_IADD_GO <= '1';
					t1_store_x <= unsigned(FPU_OUT); -- tx10
					currentState <= triSetup_calculateColorG10Delta;

				when triSetup_calculateColorG10Delta => -- colorG10 = colorG1 - colorG0
					FPU_A <= std_logic_vector(v1_store_RGBA(63 downto 32) );
					FPU_B <= std_logic_vector(NegateFloat(v0_store_RGBA(63 downto 32) ) );
					FPU_IADD_GO <= '1';
					t2_store_x <= unsigned(FPU_OUT); -- tx20
					currentState <= triSetup_calculateColorG20Delta;

				when triSetup_calculateColorG20Delta => -- colorG20 = colorG2 - colorG0
					FPU_A <= std_logic_vector(v2_store_RGBA(63 downto 32) );
					FPU_IADD_GO <= '1';
					t1_store_y <= unsigned(FPU_OUT); -- ty10
					currentState <= triSetup_calculateColorB10Delta;

				when triSetup_calculateColorB10Delta => -- colorB10 = colorB1 - colorB0
					FPU_A <= std_logic_vector(v1_store_RGBA(95 downto 64) );
					FPU_B <= std_logic_vector(NegateFloat(v0_store_RGBA(95 downto 64) ) );
					FPU_IADD_GO <= '1';
					t2_store_y <= unsigned(FPU_OUT); -- ty20
					currentState <= triSetup_calculateColorB20Delta;

				when triSetup_calculateColorB20Delta => -- colorB20 = colorB2 - colorB0
					FPU_A <= std_logic_vector(v2_store_RGBA(95 downto 64) );
					FPU_IADD_GO <= '1';
					v1_store_RGBA(31 downto 0) <= unsigned(FPU_OUT); -- colorR10
					currentState <= triSetup_calculateColorA10Delta;

				when triSetup_calculateColorA10Delta => -- colorA10 = colorA1 - colorA0
					FPU_A <= std_logic_vector(v1_store_RGBA(127 downto 96) );
					FPU_B <= std_logic_vector(NegateFloat(v0_store_RGBA(127 downto 96) ) );
					FPU_IADD_GO <= '1';
					v2_store_RGBA(31 downto 0) <= unsigned(FPU_OUT); -- colorR20
					currentState <= triSetup_calculateColorA20Delta;

				when triSetup_calculateColorA20Delta => -- colorA20 = colorA2 - colorA0
					FPU_A <= std_logic_vector(v2_store_RGBA(127 downto 96) );
					FPU_IADD_GO <= '1';
					v1_store_RGBA(63 downto 32) <= unsigned(FPU_OUT); -- colorG10
					currentState <= triSetup_calculateInvZ10Delta;

				when triSetup_calculateInvZ10Delta => -- invZ10 = invZ1 - invZ0
					FPU_A <= std_logic_vector(v1_store_invZ);
					FPU_B <= std_logic_vector(NegateFloat(v0_store_invZ) );
					FPU_IADD_GO <= '1';
					v2_store_RGBA(63 downto 32) <= unsigned(FPU_OUT); -- colorG20
					currentState <= triSetup_calculateInvZ20Delta;

				when triSetup_calculateInvZ20Delta => -- invZ20 = invZ2 - invZ0
					FPU_A <= std_logic_vector(v2_store_invZ);
					FPU_IADD_GO <= '1';
					v1_store_RGBA(95 downto 64) <= unsigned(FPU_OUT); -- colorB10
					currentState <= triSetup_calculateInvW10Delta;

				when triSetup_calculateInvW10Delta => -- invW10 = invW1 - invW0
					FPU_A <= std_logic_vector(v1_store_invW);
					FPU_B <= std_logic_vector(NegateFloat(v0_store_invW) );
					FPU_IADD_GO <= '1';
					v2_store_RGBA(95 downto 64) <= unsigned(FPU_OUT); -- colorB20
					currentState <= triSetup_calculateInvW20Delta;

				when triSetup_calculateInvW20Delta => -- invW20 = invW2 - invW0
					FPU_A <= std_logic_vector(v2_store_invW);
					FPU_IADD_GO <= '1';
					v1_store_RGBA(127 downto 96) <= unsigned(FPU_OUT); -- colorA10
					currentState <= triSetup_waitForDeltasCompletion0;

				when triSetup_waitForDeltasCompletion0 =>
					FPU_IADD_GO <= '0';
					v2_store_RGBA(127 downto 96) <= unsigned(FPU_OUT); -- colorA20
					currentState <= triSetup_waitForDeltasCompletion1;
					
				when triSetup_waitForDeltasCompletion1 =>
					FPU_IADD_GO <= '0';
					v1_store_invZ <= unsigned(FPU_OUT); -- invZ10
					currentState <= triSetup_waitForDeltasCompletion2;

				when triSetup_waitForDeltasCompletion2 =>
					FPU_IADD_GO <= '0';
					v2_store_invZ <= unsigned(FPU_OUT); -- invZ20
					currentState <= triSetup_waitForDeltasCompletion3;

				when triSetup_waitForDeltasCompletion3 =>
					FPU_IADD_GO <= '0';
					v1_store_invW <= unsigned(FPU_OUT); -- invW10
					currentState <= triSetup_waitForDeltasCompletion4;

				when triSetup_waitForDeltasCompletion4 =>
					FPU_IADD_GO <= '0';
					v2_store_invW <= unsigned(FPU_OUT); -- invW20
					currentState <= triSetup_broadcastOutput;

				when triSetup_broadcastOutput =>
					if (RAST_readyForTriSetupData = '1' and triSetupDataIsValid = '1') then
						triSetupDataIsValid <= '0'; -- Deassert after one clock cycle
						stats_totalTrianglesPassed <= stats_totalTrianglesPassed + 1;
						readyForNextTriSig <= '1';
						currentState <= triSetup_waitForTriData;
					elsif (RAST_readyForTriSetupData = '1') then
						RAST_outMinX <= std_logic_vector(minX);
						RAST_outMaxX <= std_logic_vector(maxX);
						RAST_outMinY <= std_logic_vector(minY);
						RAST_outMaxY <= std_logic_vector(maxY);
						RAST_outInitialBarycentricRowResetA <= std_logic_vector(barycentricRowResetA);
						RAST_outInitialBarycentricRowResetB <= std_logic_vector(barycentricRowResetB);
						RAST_outInitialBarycentricRowResetC <= std_logic_vector(barycentricRowResetC);
						RAST_outIsTopLeftEdgeA <= isTopLeftEdgeA;
						RAST_outIsTopLeftEdgeB <= isTopLeftEdgeB;
						RAST_outIsTopLeftEdgeC <= isTopLeftEdgeC;
						RAST_outBarycentricXDeltaA <= std_logic_vector(barycentricXDeltaA);
						RAST_outBarycentricXDeltaB <= std_logic_vector(barycentricXDeltaB);
						RAST_outBarycentricXDeltaC <= std_logic_vector(barycentricXDeltaC);
						RAST_outBarycentricYDeltaA <= std_logic_vector(barycentricYDeltaA);
						RAST_outBarycentricYDeltaB <= std_logic_vector(barycentricYDeltaB);
						RAST_outBarycentricYDeltaC <= std_logic_vector(barycentricYDeltaC);
						RAST_v0_out_invZ <= std_logic_vector(v0_store_invZ);
						RAST_v10_out_invZ <= std_logic_vector(v1_store_invZ);
						RAST_v20_out_invZ <= std_logic_vector(v2_store_invZ);
						RAST_v0_out_invW <= std_logic_vector(v0_store_invW);
						RAST_v10_out_invW <= std_logic_vector(v1_store_invW);
						RAST_v20_out_invW <= std_logic_vector(v2_store_invW);
						RAST_t0_out_x <= std_logic_vector(t0_store_x);
						RAST_t0_out_y <= std_logic_vector(t0_store_y);
						RAST_t10_out_x <= std_logic_vector(t1_store_x);
						RAST_t10_out_y <= std_logic_vector(t1_store_y);
						RAST_t20_out_x <= std_logic_vector(t2_store_x);
						RAST_t20_out_y <= std_logic_vector(t2_store_y);
						RAST_v0_out_colorRGBA <= std_logic_vector(v0_store_RGBA);
						RAST_v10_out_colorRGBA <= std_logic_vector(v1_store_RGBA);
						RAST_v20_out_colorRGBA <= std_logic_vector(v2_store_RGBA);
						RAST_outBarycentricInverse <= std_logic_vector(barycentricInverse);
						triSetupDataIsValid <= '1';
					end if;
			end case;
		end if;
	end process;


end Behavioral;
