library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.TriSetupState.all;

entity TriSetup is
	Port ( clk : in STD_LOGIC;

	-- Clip unit interfaces begin
		CLIP_v0_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v0_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v0_in_z : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v0_in_w : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v1_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v1_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v1_in_z : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v1_in_w : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v2_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v2_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v2_in_z : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v2_in_w : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_t0_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_t0_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_t1_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_t1_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_t2_in_x : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_t2_in_y : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_v0_in_RGBA : in STD_LOGIC_VECTOR(127 downto 0);
		CLIP_v1_in_RGBA : in STD_LOGIC_VECTOR(127 downto 0);
		CLIP_v2_in_RGBA : in STD_LOGIC_VECTOR(127 downto 0);

		CLIP_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		CLIP_newTriBegin : in STD_LOGIC;
		CLIP_readyForNewTri : out STD_LOGIC := '0';
	-- Clip unit interfaces end

	-- TexConfig interfaces begin
		TEXCFG_nointerpolation : in STD_LOGIC; -- Means that none of the vertex attributes need to be interpolated (so we can skip a ton of steps)
	-- TexConfig interfaces end

	-- Rasterizer interfaces begin
		RAST_outBarycentricInverse : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- These are all floating point values
		RAST_v0_out_Z : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_v10_out_Z : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		RAST_v20_out_Z : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
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

		RAST_outMinX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- These are all signed integer values:
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

		RAST_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		RAST_readyForTriSetupData : in STD_LOGIC;
		RAST_triSetupDataIsValid : out STD_LOGIC := '0';
	-- Rasterizer interfaces end

	-- FPU interfaces begin

		-- ADD pipe for add/subtract:
		FPU_ADD_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_ADD_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_ADD_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_ADD_GO : out STD_LOGIC := '0';

		-- MUL pipe for multiplication:
		FPU_MUL_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_MUL_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_MUL_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_MUL_GO : out STD_LOGIC := '0';

		-- CNV pipe for float-to-int conversion and rounding:
		FPU_CNV_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_CNV_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_CNV_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_CNV_GO : out STD_LOGIC := '0';

		-- SPEC pipe for reciprocal:
		FPU_SPEC_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_SPEC_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_SPEC_GO : out STD_LOGIC := '0';
	-- FPU interfaces end

	-- Triangle Setup State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(TRI_SETUP_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- Triangle Setup State Block interface end

	-- Command processor interface begin
		CMD_TriSetupIsIdle : out STD_LOGIC := '0';
	-- Command processor interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_TriSetup_State : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_MinX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MaxX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MinY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MaxY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_XProdSub0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_XProdSub1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_XProdSub2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_XProdSub3 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_XProdProd0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_XProdProd1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_LeftProd0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_LeftProd1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_LeftProd2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RightProd0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RightProd1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RightProd2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_TwiceTriArea : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end TriSetup;

architecture Behavioral of TriSetup is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

	type trisetup_state_t is (
		triSetup_waitForTriData, -- 0

		-- Initial vertex value culling (NaN/INF/Zero invW cause the triangle to be culled)
		triSetup_NAN_INF_ZeroW_Cull, -- 1
		triSetup_FloatDegenerateTriDuplicateVert, -- 2

		-- Computing invW:
		triSetup_InvWSubmitRcpW0, -- 3 -- rcp w0; mul x0 * VIEWPORT_HALF_WIDTH
		triSetup_InvWSubmitRcpW1, -- 4 -- rcp w1; mul x1 * VIEWPORT_HALF_WIDTH
		triSetup_InvWSubmitRcpW2, -- 5 -- rcp w2; mul x2 * VIEWPORT_HALF_WIDTH
		triSetup_InvWWait0, -- 6 -- mul y0 * -VIEWPORT_HALF_HEIGHT
		triSetup_InvWWait1, -- 7 -- mul y1 * -VIEWPORT_HALF_HEIGHT
		triSetup_InvWWait2, -- 8 -- mul y2 * -VIEWPORT_HALF_HEIGHT
		triSetup_InvWWait3, -- 9 -- mul z0 * zScale
		triSetup_InvWWait4, -- 10 -- mul z1 * zScale
		triSetup_InvWWait5, -- 11 -- mul z2 * zScale
		triSetup_InvWWait6, -- 12 -- Wait for rcp w0 to finish
		triSetup_InvWWait7,	-- 13 -- Wait for rcp w0 to finish
		triSetup_InvWWait8,	-- 14 -- Wait for rcp w0 to finish
		triSetup_InvWWait9,	-- 15 -- Wait for rcp w0 to finish
		triSetup_InvWWait10, -- 16 -- Wait for rcp w0 to finish
		triSetup_InvWWait11, -- 17 -- Wait for rcp w0 to finish
		triSetup_InvWMultX0, -- 18 -- mul x0 * rcp_w0
		triSetup_InvWMultX1, -- 19 -- mul x1 * rcp_w1
		triSetup_InvWMultX2, -- 20 -- mul x2 * rcp_w2
		triSetup_InvWMultY0, -- 21 -- mul y0 * rcp_w0
		triSetup_InvWMultY1, -- 22 -- mul y1 * rcp_w1
		triSetup_InvWMultY2, -- 23 -- mul y2 * rcp_w2
		triSetup_InvWMultZ0, -- 24 -- mul z0 * rcp_w0; add x0 + VIEWPORT_HALF_WIDTH
		triSetup_InvWMultZ1, -- 25 -- mul z1 * rcp_w1; add x1 + VIEWPORT_HALF_WIDTH
		triSetup_InvWMultZ2, -- 26 -- mul z2 * rcp_w2; add x2 + VIEWPORT_HALF_WIDTH
		triSetup_InvWMultR0, -- 27 -- add y0 + VIEWPORT_HALF_HEIGHT; mul r0 * rcp_w0
		triSetup_InvWMultG0, -- 28 -- add y1 + VIEWPORT_HALF_HEIGHT; mul g0 * rcp_w0
		triSetup_InvWMultB0, -- 29 -- add y2 + VIEWPORT_HALF_HEIGHT; mul b0 * rcp_w0
		triSetup_InvWAddZ0, -- 30 -- add z0 + zOffset
		triSetup_InvWAddZ1, -- 31 -- add z1 + zOffset
		triSetup_InvWAddZ2, -- 32 -- add z2 + zOffset

		-- Converting the float32 x/y coordinates to fixed-point integers
		triSetup_QuantizeSnapToGridX0, -- 33 -- cnv_F_to_I16_rne x0; mul a0 * rcp_w0
		triSetup_QuantizeSnapToGridX1, -- 34 -- cnv_F_to_I16_rne x1; mul tx0 * rcp_w0
		triSetup_QuantizeSnapToGridX2, -- 35 -- cnv_F_to_I16_rne x2; mul ty0 * rcp_w0
		triSetup_QuantizeSnapToGridY0, -- 36 -- cnv_F_to_I16_rne y0; mul r1 * rcp_w1; rcp z0
		triSetup_QuantizeSnapToGridY1, -- 37 -- cnv_F_to_I16_rne y1; mul g1 * rcp_w1; rcp z1
		triSetup_QuantizeSnapToGridY2, -- 38 -- cnv_F_to_I16_rne y2; mul b1 * rcp_w1; rcp z2
		triSetup_QuantizeSnapToGridWait0, -- 39 -- mul a1 * rcp_w1
		triSetup_QuantizeSnapToGridWait1, -- 40 -- mul tx1 * rcp_w1
		triSetup_QuantizeSnapToGridWait2, -- 41 -- mul ty1 * rcp_w1
		triSetup_QuantizeSnapToGridWait3, -- 42 -- mul r2 * rcp_w2

		triSetup_duplicateVertexCull, -- 43 -- mul g2 * rcp_w2

		-- Bounds calculations and trivial rejection culling:
		triSetup_bounds, -- 44 -- mul b2 * rcp_w2
		triSetup_boundsClamp, -- 45 -- mul a2 * rcp_w2
		triSetup_boundsCull, -- 46 -- mul tx2 * rcp_w2

		-- Compute cross-product to get (signed) twiceTriangleArea
		triSetup_crossProduct, -- 47 -- mul ty2 * rcp_w2
		triSetup_crossProduct2, -- 48
		triSetup_crossProduct4, -- 49

		-- Backface cull (cull if twiceTriangleArea <= 0)
		triSetup_backfaceCull, -- 50

		-- Send data to reciprocal unit
		triSetup_sendToRecip, -- 51
		triSetup_waitForConvert0, -- 52
		triSetup_waitForConvert1, -- 53
		triSetup_waitForConvert2, -- 54
		triSetup_setupRecip, -- 55

		-- Compute top-left edge rule offsets
		triSetup_topLeftBiasA, -- 56

		-- Compute barycentric deltas
		triSetup_barycentricXDeltaA, -- 57

		-- Compute barycentric values
		triSetup_leftInner0, -- 58
		triSetup_leftProduct0, -- 59
		triSetup_crossProductSumA, -- 60
		triSetup_applyTopLeftRule, -- 61

		triSetup_waitForReciprocalResult, -- 62

		-- Compute 10 and 20 delta values for each of our interpolated components:
		triSetup_calculateTX10Delta, -- 63
		triSetup_calculateTX20Delta, -- 64
		triSetup_calculateTY10Delta, -- 65
		triSetup_calculateTY20Delta, -- 66
		triSetup_calculateColorR10Delta, -- 67
		triSetup_calculateColorR20Delta, -- 68
		triSetup_calculateColorG10Delta, -- 69
		triSetup_calculateColorG20Delta, -- 70
		triSetup_calculateColorB10Delta, -- 71
		triSetup_calculateColorB20Delta, -- 72
		triSetup_calculateColorA10Delta, -- 73
		triSetup_calculateColorA20Delta, -- 74
		triSetup_calculateZ10Delta, -- 75
		triSetup_calculateZ20Delta, -- 76
		triSetup_calculateInvW10Delta, -- 77
		triSetup_calculateInvW20Delta, -- 78
		triSetup_waitForDeltasCompletion0, -- 79
		triSetup_waitForDeltasCompletion1, -- 80
		triSetup_waitForDeltasCompletion2, -- 81
		triSetup_waitForDeltasCompletion3, -- 82
		triSetup_waitForDeltasCompletion4, -- 83

		-- Finally, send our setup tri result data to the rasterizer
		triSetup_broadcastOutput, -- 84
		triSetup_broadcastNewDrawEventEmptyTriangle -- 85
		);

	pure function isTopLeftEdge(vertA_X : signed(15 downto 0); 
		vertA_Y : signed(15 downto 0); 
		vertB_X : signed(15 downto 0); 
		vertB_Y : signed(15 downto 0) ) return std_logic is
		variable dx : signed(31 downto 0);
		variable dy : signed(31 downto 0);
	begin
		dx := resize(vertB_X, 32) - resize(vertA_X, 32);
		dy := resize(vertB_Y, 32) - resize(vertA_Y, 32);
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

	pure function IsFloatNANorINF(floatVal : f32) return boolean is
	begin
		return (floatVal(30 downto 23) = "11111111"); -- Our float is INF or NAN if the exponent bits are set to all 1's
	end function;

	pure function IsDenormal(floatVal : f32) return boolean is
	begin
		return (floatVal(30 downto 23) = "00000000"); -- Our float is denormal (including zero) if the exponent bits are set to all 0's
	end function;

	-- Simply flip the sign bit:
	pure function NegateFloat(inVal : f32) return f32 is
	begin
		return (not inVal(31) ) & (inVal(30 downto 0) );
	end function;

	-- Should we cull this whole triangle because one of the vertices has a bad (NAN, INF, or denormal wPos) position value?
	pure function ShouldCullTriBadVertex(xPos : f32; yPos : f32; zPos : f32; wPos : f32) return boolean is
	begin
		return (IsFloatNANorINF(xPos) or IsFloatNANorINF(yPos) or IsFloatNANorINF(zPos) or IsFloatNANorINF(wPos) or IsDenormal(wPos) );
	end function;

	constant oneF : unsigned(30 downto 0) := "0111111100000000000000000000000"; -- This is 0x3f800000 with the top (sign) bit cut off

type vertexColor is record
	r : f32;
	g : f32;
	b : f32;
	a : f32;
end record vertexColor;

-- External store signals
signal v0_store_Z0 : f32 := (others => '0');
signal v0_store_invW : f32 := (others => '0');
signal v1_store_Z10 : f32 := (others => '0');
signal v1_store_invW : f32 := (others => '0');
signal v2_store_Z20 : f32 := (others => '0');
signal v2_store_invW : f32 := (others => '0');
signal t0_store_x : f32 := (others => '0');
signal t0_store_y : f32 := (others => '0');
signal t1_store_x : f32 := (others => '0');
signal t1_store_y : f32 := (others => '0');
signal t2_store_x : f32 := (others => '0');
signal t2_store_y : f32 := (others => '0');
signal v0_store_RGBA : vertexColor;
signal v1_store_RGBA : vertexColor;
signal v2_store_RGBA : vertexColor;

-- Current state block:
signal currentStateBlock : sTriSetupState := DEFAULT_TRI_SETUP_STATE;

-- Internal signals
signal readyForNextTriSig : STD_LOGIC := '1';
signal currentState : trisetup_state_t := triSetup_waitForTriData;
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');
signal hasBroadcastStartForDrawID : std_logic := '0';

-- Internal computation intermediaries
signal v0_xPosFloat : f32 := (others => '0'); -- 32-bit floating point
signal v1_xPosFloat : f32 := (others => '0');
signal v2_xPosFloat : f32 := (others => '0');
signal v0_yPosFloat : f32 := (others => '0');
signal v1_yPosFloat : f32 := (others => '0');
signal v2_yPosFloat : f32 := (others => '0');
signal v0_zPosFloat : f32 := (others => '0');
signal v1_zPosFloat : f32 := (others => '0');
signal v2_zPosFloat : f32 := (others => '0');
signal v0_wPosFloat : f32 := (others => '0');
signal v1_wPosFloat : f32 := (others => '0');
signal v2_wPosFloat : f32 := (others => '0');

signal v0_x : signed(15 downto 0) := to_signed(320, 16); -- 16 bit signed integer
signal v0_y : signed(15 downto 0) := to_signed(120, 16);
signal v1_x : signed(15 downto 0) := to_signed(480, 16);
signal v1_y : signed(15 downto 0) := to_signed(360, 16);
signal v2_x : signed(15 downto 0) := to_signed(160, 16);
signal v2_y : signed(15 downto 0) := to_signed(240, 16);

signal minX : signed(15 downto 0) := (others => '0'); -- Triangle AABB clipped to screenspace (x is 0 to 639, y is 0 to 479)
signal minY : signed(15 downto 0) := (others => '0');
signal maxX : signed(15 downto 0) := (others => '0');
signal maxY : signed(15 downto 0) := (others => '0');

signal crossProdSub0 : signed(31 downto 0) := (others => '0'); -- Cross product temporaries
signal crossProdSub1 : signed(31 downto 0) := (others => '0');
signal crossProdSub2 : signed(31 downto 0) := (others => '0');
signal crossProdSub3 : signed(31 downto 0) := (others => '0');
signal crossProdProd0 : signed(63 downto 0) := (others => '0');
signal crossProdProd1 : signed(63 downto 0) := (others => '0');

signal leftFirstTermInner0 : signed(31 downto 0) := (others => '0'); -- 32 bit signed integer
signal leftFirstTermInner1 : signed(31 downto 0) := (others => '0');
signal leftFirstTermInner2 : signed(31 downto 0) := (others => '0');

signal rightFirstTermInner0 : signed(31 downto 0) := (others => '0'); -- 32 bit signed integer
signal rightFirstTermInner1 : signed(31 downto 0) := (others => '0');
signal rightFirstTermInner2 : signed(31 downto 0) := (others => '0');

signal leftSecondTermInner0 : signed(31 downto 0) := (others => '0'); -- 32 bit signed integer
signal leftSecondTermInner1 : signed(31 downto 0) := (others => '0');
signal leftSecondTermInner2 : signed(31 downto 0) := (others => '0');

signal rightSecondTermInner0 : signed(31 downto 0) := (others => '0'); -- 32 bit signed integer
signal rightSecondTermInner1 : signed(31 downto 0) := (others => '0');
signal rightSecondTermInner2 : signed(31 downto 0) := (others => '0');

signal leftProduct0 : signed(63 downto 0) := (others => '0'); -- 32 bit signed integer (will get chunked down shortly)
signal leftProduct1 : signed(63 downto 0) := (others => '0');
signal leftProduct2 : signed(63 downto 0) := (others => '0');

signal rightProduct0 : signed(63 downto 0) := (others => '0'); -- 32 bit signed integer (will get chunked down shortly)
signal rightProduct1 : signed(63 downto 0) := (others => '0');
signal rightProduct2 : signed(63 downto 0) := (others => '0');

signal isTopLeftEdgeA : STD_LOGIC := '0';
signal isTopLeftEdgeB : STD_LOGIC := '0';
signal isTopLeftEdgeC : STD_LOGIC := '0';

-- Note that the triangle does get backface-culled in the case that this is a negative or zero value
signal twiceTriangleArea : signed(31 downto 0) := (others => '0'); -- This must be signed so we can test if it's negative or not
signal twiceTriangleAreaFloat : f32 := (others => '0'); -- This is the floating-point representation of twiceTriangleArea (after the uint32 to float conversion)
signal reciprocalCycleCounter : unsigned(3 downto 0) := (others => '0'); -- Keeps track of how many cycles we have remaining in our reciprocal calculation

signal barycentricInverse : f32 := (others => '0'); -- float32 value that is calculated as (1.0f / twiceTriangleArea) using the FPU reciprocal unit

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
signal stats_totalTrianglesPassed : unsigned(11 downto 0) := (others => '0');

signal triSetupDataIsValid : std_logic := '0';
signal skipZOffset : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

RAST_triSetupDataIsValid <= triSetupDataIsValid;
CLIP_readyForNewTri <= readyForNextTriSig;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

-- Skip performing our Z-offset addition stages (saves 3 cycles per triangle) if our Z-Offset is 0, which it most commonly is
skipZOffset <= '1' when currentStateBlock.ViewportZOffset(30 downto 23) = "00000000" else '0';

DBG_TriSetup_State <= std_logic_vector(to_unsigned(trisetup_state_t'pos(currentState), 8) );
DBG_MinX <= std_logic_vector(minX);
DBG_MaxX <= std_logic_vector(maxX);
DBG_MinY <= std_logic_vector(minY);
DBG_MaxY <= std_logic_vector(maxY);
DBG_XProdSub0 <= std_logic_vector(crossProdSub0);
DBG_XProdSub1 <= std_logic_vector(crossProdSub1);
DBG_XProdSub2 <= std_logic_vector(crossProdSub2);
DBG_XProdSub3 <= std_logic_vector(crossProdSub3);
DBG_XProdProd0 <= std_logic_vector(resize(crossProdProd0, 32) );
DBG_XProdProd1 <= std_logic_vector(resize(crossProdProd1, 32) );
DBG_LeftProd0 <= std_logic_vector(resize(leftProduct0, 32) );
DBG_LeftProd1 <= std_logic_vector(resize(leftProduct1, 32) );
DBG_LeftProd2 <= std_logic_vector(resize(leftProduct2, 32) );
DBG_RightProd0 <= std_logic_vector(resize(rightProduct0, 32) );
DBG_RightProd1 <= std_logic_vector(resize(rightProduct1, 32) );
DBG_RightProd2 <= std_logic_vector(resize(rightProduct2, 32) );
DBG_TwiceTriArea <= std_logic_vector(twiceTriangleArea);

	StatsProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
			case currentState is
				when triSetup_waitForTriData =>
					statCyclesIdle <= statCyclesIdle + 1;

				when triSetup_broadcastOutput =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process StatsProcess;

	MainStateMachine : process(clk)
	begin
		if (rising_edge(clk) ) then                       
			STATE_ConsumeStateSlot <= '0';

			case currentState is
				-- Load new triangle data
				when triSetup_waitForTriData =>
					triSetupDataIsValid <= '0';
					CMD_TriSetupIsIdle <= '0';

					v0_xPosFloat <= f32(CLIP_v0_in_x);
					v0_yPosFloat <= f32(CLIP_v0_in_y);
					v1_xPosFloat <= f32(CLIP_v1_in_x);
					v1_yPosFloat <= f32(CLIP_v1_in_y);
					v2_xPosFloat <= f32(CLIP_v2_in_x);
					v2_yPosFloat <= f32(CLIP_v2_in_y);
					v0_zPosFloat <= f32(CLIP_v0_in_z);
					v1_zPosFloat <= f32(CLIP_v1_in_z);
					v2_zPosFloat <= f32(CLIP_v2_in_z);
					v0_wPosFloat <= f32(CLIP_v0_in_w);
					v1_wPosFloat <= f32(CLIP_v1_in_w);
					v2_wPosFloat <= f32(CLIP_v2_in_w);
					t0_store_x <= f32(CLIP_t0_in_x);
					t0_store_y <= f32(CLIP_t0_in_y);
					t1_store_x <= f32(CLIP_t1_in_x);
					t1_store_y <= f32(CLIP_t1_in_y);
					t2_store_x <= f32(CLIP_t2_in_x);
					t2_store_y <= f32(CLIP_t2_in_y);
					v0_store_RGBA.r <= f32(CLIP_v0_in_RGBA(31 downto 0) );
					v0_store_RGBA.g <= f32(CLIP_v0_in_RGBA(63 downto 32) );
					v0_store_RGBA.b <= f32(CLIP_v0_in_RGBA(95 downto 64) );
					v0_store_RGBA.a <= f32(CLIP_v0_in_RGBA(127 downto 96) );
					v1_store_RGBA.r <= f32(CLIP_v1_in_RGBA(31 downto 0) );
					v1_store_RGBA.g <= f32(CLIP_v1_in_RGBA(63 downto 32) );
					v1_store_RGBA.b <= f32(CLIP_v1_in_RGBA(95 downto 64) );
					v1_store_RGBA.a <= f32(CLIP_v1_in_RGBA(127 downto 96) );
					v2_store_RGBA.r <= f32(CLIP_v2_in_RGBA(31 downto 0) );
					v2_store_RGBA.g <= f32(CLIP_v2_in_RGBA(63 downto 32) );
					v2_store_RGBA.b <= f32(CLIP_v2_in_RGBA(95 downto 64) );
					v2_store_RGBA.a <= f32(CLIP_v2_in_RGBA(127 downto 96) );

					if (CLIP_newTriBegin = '1' and readyForNextTriSig = '1') then

						if (currentDrawEventID /= unsigned(CLIP_CurrentDrawEventID) ) then
							hasBroadcastStartForDrawID <= '0';
						end if;
						currentDrawEventID <= unsigned(CLIP_CurrentDrawEventID);

						readyForNextTriSig <= '0';
						currentState <= triSetup_NAN_INF_ZeroW_Cull; -- Start the triangle setup state machine
					else
						if (CLIP_newTriBegin = '0' and readyForNextTriSig = '1') then
							CMD_TriSetupIsIdle <= '1';
						end if;

						readyForNextTriSig <= '1';
					end if;

				-- Triangle setup code

				when triSetup_NAN_INF_ZeroW_Cull =>
					if (unsigned(STATE_NextDrawID) = currentDrawEventID and STATE_StateIsValid = '1') then
						STATE_ConsumeStateSlot <= '1';

						currentStateBlock <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID);
					end if;

					if (ShouldCullTriBadVertex(v0_xPosFloat, v0_yPosFloat, v0_zPosFloat, v0_wPosFloat) or ShouldCullTriBadVertex(v1_xPosFloat, v1_yPosFloat, v1_zPosFloat, v1_wPosFloat) or ShouldCullTriBadVertex(v2_xPosFloat, v2_yPosFloat, v2_zPosFloat, v2_wPosFloat) ) then
						stats_totalTrianglesINF_NAN_ZeroWVertCulled <= stats_totalTrianglesINF_NAN_ZeroWVertCulled + 1;
						if (hasBroadcastStartForDrawID = '1') then
							readyForNextTriSig <= '1';
							currentState <= triSetup_waitForTriData;
						else
							currentState <= triSetup_broadcastNewDrawEventEmptyTriangle;
						end if;
					else
						currentState <= triSetup_FloatDegenerateTriDuplicateVert;
					end if;

				when triSetup_FloatDegenerateTriDuplicateVert =>
					if ( ( (v0_xPosFloat = v1_xPosFloat) and (v0_yPosFloat = v1_yPosFloat) and (v0_zPosFloat = v1_zPosFloat) and (v0_wPosFloat = v1_wPosFloat) ) or -- v0 == v1
					( (v0_xPosFloat = v2_xPosFloat) and (v0_yPosFloat = v2_yPosFloat) and (v0_zPosFloat = v2_zPosFloat) and (v0_wPosFloat = v2_wPosFloat) ) or -- v0 == v2
					( (v1_xPosFloat = v2_xPosFloat) and (v1_yPosFloat = v2_yPosFloat) and (v1_zPosFloat = v2_zPosFloat) and (v1_wPosFloat = v2_wPosFloat) ) ) then -- v1 == v2
						stats_totalTrianglesDuplicateVertCulled <= stats_totalTrianglesDuplicateVertCulled + 1;
						if (hasBroadcastStartForDrawID = '1') then
							readyForNextTriSig <= '1';
							currentState <= triSetup_waitForTriData;
						else
							currentState <= triSetup_broadcastNewDrawEventEmptyTriangle;
						end if;
					else
						currentState <= triSetup_InvWSubmitRcpW0;
					end if;

				when triSetup_InvWSubmitRcpW0 => -- 3 -- rcp w0; mul x0 * VIEWPORT_HALF_WIDTH
					FPU_SPEC_A <= std_logic_vector(v0_wPosFloat);
					FPU_SPEC_GO <= '1';

					FPU_MUL_A <= std_logic_vector(v0_xPosFloat);
					FPU_MUL_B <= std_logic_vector(currentStateBlock.ViewportHalfWidth);
					FPU_MUL_GO <= '1';
					currentState <= triSetup_InvWSubmitRcpW1;

				when triSetup_InvWSubmitRcpW1 => -- 4 -- rcp w1; mul x1 * VIEWPORT_HALF_WIDTH
					FPU_SPEC_A <= std_logic_vector(v1_wPosFloat);

					FPU_MUL_A <= std_logic_vector(v1_xPosFloat);
					currentState <= triSetup_InvWSubmitRcpW2;

				when triSetup_InvWSubmitRcpW2 => -- 5 -- rcp w2; mul x2 * VIEWPORT_HALF_WIDTH
					FPU_SPEC_A <= std_logic_vector(v2_wPosFloat);

					FPU_MUL_A <= std_logic_vector(v2_xPosFloat);
					currentState <= triSetup_InvWWait0;

				when triSetup_InvWWait0 => -- 6 -- mul y0 * -VIEWPORT_HALF_HEIGHT
					FPU_SPEC_GO <= '0';

					FPU_MUL_A <= std_logic_vector(v0_yPosFloat);
					FPU_MUL_B <= std_logic_vector(NegateFloat(currentStateBlock.ViewportHalfHeight) );
					currentState <= triSetup_InvWWait1;

				when triSetup_InvWWait1 => -- 7 -- mul y1 * -VIEWPORT_HALF_HEIGHT
					FPU_MUL_A <= std_logic_vector(v1_yPosFloat);
					currentState <= triSetup_InvWWait2;

				when triSetup_InvWWait2 => -- 8 -- mul y2 * -VIEWPORT_HALF_HEIGHT
					FPU_MUL_A <= std_logic_vector(v2_yPosFloat);
					currentState <= triSetup_InvWWait3;

				when triSetup_InvWWait3 => -- 9 -- mul z0 * zScale
					FPU_MUL_A <= std_logic_vector(v0_zPosFloat);
					FPU_MUL_B <= std_logic_vector(currentStateBlock.ViewportZScale);

					v0_xPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWWait4;

				when triSetup_InvWWait4 => -- 10 -- mul z1 * zScale
					FPU_MUL_A <= std_logic_vector(v1_zPosFloat);

					v1_xPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWWait5;

				when triSetup_InvWWait5 => -- 11 -- mul z2 * zScale
					FPU_MUL_A <= std_logic_vector(v2_zPosFloat);

					v2_xPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWWait6;

				when triSetup_InvWWait6 => -- 12 -- Wait for rcp w0 to finish
					FPU_MUL_GO <= '0';

					v0_yPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWWait7;

				when triSetup_InvWWait7 =>	-- 13 -- Wait for rcp w0 to finish
					v1_yPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWWait8;

				when triSetup_InvWWait8 =>	-- 14 -- Wait for rcp w0 to finish
					v2_yPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWWait9;

				when triSetup_InvWWait9 =>	-- 15 -- Wait for rcp w0 to finish
					v0_zPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWWait10;

				when triSetup_InvWWait10 => -- 16 -- Wait for rcp w0 to finish
					v1_zPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWWait11;

				when triSetup_InvWWait11 => -- 17 -- Wait for rcp w0 to finish
					v2_zPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWMultX0;

				when triSetup_InvWMultX0 => -- 18 -- mul x0 * rcp_w0
					v0_store_invW <= f32(FPU_SPEC_OUT);

					FPU_MUL_A <= std_logic_vector(v0_xPosFloat);
					FPU_MUL_B <= FPU_SPEC_OUT;
					FPU_MUL_GO <= '1';
					currentState <= triSetup_InvWMultX1;

				when triSetup_InvWMultX1 => -- 19 -- mul x1 * rcp_w1
					v1_store_invW <= f32(FPU_SPEC_OUT);

					FPU_MUL_A <= std_logic_vector(v1_xPosFloat);
					FPU_MUL_B <= FPU_SPEC_OUT;
					currentState <= triSetup_InvWMultX2;

				when triSetup_InvWMultX2 => -- 20 -- mul x2 * rcp_w2
					v2_store_invW <= f32(FPU_SPEC_OUT);

					FPU_MUL_A <= std_logic_vector(v2_xPosFloat);
					FPU_MUL_B <= FPU_SPEC_OUT;
					currentState <= triSetup_InvWMultY0;

				when triSetup_InvWMultY0 => -- 21 -- mul y0 * rcp_w0
					FPU_MUL_A <= std_logic_vector(v0_yPosFloat);
					FPU_MUL_B <= std_logic_vector(v0_store_invW);
					currentState <= triSetup_InvWMultY1;

				when triSetup_InvWMultY1 => -- 22 -- mul y1 * rcp_w1
					FPU_MUL_A <= std_logic_vector(v1_yPosFloat);
					FPU_MUL_B <= std_logic_vector(v1_store_invW);
					currentState <= triSetup_InvWMultY2;

				when triSetup_InvWMultY2 => -- 23 -- mul y2 * rcp_w2
					FPU_MUL_A <= std_logic_vector(v2_yPosFloat);
					FPU_MUL_B <= std_logic_vector(v2_store_invW);
					currentState <= triSetup_InvWMultZ0;

				when triSetup_InvWMultZ0 => -- 24 -- mul z0 * rcp_w0; add x0 + VIEWPORT_HALF_WIDTH
					FPU_MUL_A <= std_logic_vector(v0_zPosFloat);
					FPU_MUL_B <= std_logic_vector(v0_store_invW);

					FPU_ADD_A <= FPU_MUL_OUT;
					FPU_ADD_B <= std_logic_vector(currentStateBlock.ViewportHalfWidth);
					FPU_ADD_GO <= '1';

					v0_xPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWMultZ1;

				when triSetup_InvWMultZ1 => -- 25 -- mul z1 * rcp_w1; add x1 + VIEWPORT_HALF_WIDTH
					FPU_MUL_A <= std_logic_vector(v1_zPosFloat);
					FPU_MUL_B <= std_logic_vector(v1_store_invW);

					FPU_ADD_A <= FPU_MUL_OUT;

					v1_xPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWMultZ2;

				when triSetup_InvWMultZ2 => -- 26 -- mul z2 * rcp_w2; add x2 + VIEWPORT_HALF_WIDTH
					FPU_MUL_A <= std_logic_vector(v2_zPosFloat);
					FPU_MUL_B <= std_logic_vector(v2_store_invW);

					FPU_ADD_A <= FPU_MUL_OUT;

					v2_xPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWMultR0;

				when triSetup_InvWMultR0 => -- 27 -- add y0 + VIEWPORT_HALF_HEIGHT; mul r0 * rcp_w0
					FPU_MUL_A <= std_logic_vector(v0_store_RGBA.r);
					FPU_MUL_B <= std_logic_vector(v0_store_invW);

					FPU_ADD_A <= FPU_MUL_OUT;
					FPU_ADD_B <= std_logic_vector(currentStateBlock.ViewportHalfHeight);

					v0_yPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWMultG0;

				when triSetup_InvWMultG0 => -- 28 -- add y1 + VIEWPORT_HALF_HEIGHT; mul g0 * rcp_w0
					FPU_MUL_A <= std_logic_vector(v0_store_RGBA.g);

					FPU_ADD_A <= FPU_MUL_OUT;

					v1_yPosFloat <= f32(FPU_MUL_OUT);
					currentState <= triSetup_InvWMultB0;

				when triSetup_InvWMultB0 => -- 29 -- add y2 + VIEWPORT_HALF_HEIGHT; mul b0 * rcp_w0
					FPU_MUL_A <= std_logic_vector(v0_store_RGBA.b);

					FPU_ADD_A <= FPU_MUL_OUT;

					v2_yPosFloat <= f32(FPU_MUL_OUT);

					v0_xPosFloat <= f32(FPU_ADD_OUT);

					-- Save 3 cycles per triangle if we skip the Z-offset add since it's zero!
					if (skipZOffset = '1') then
						currentState <= triSetup_QuantizeSnapToGridX0;
					else
						currentState <= triSetup_InvWAddZ0;
					end if;

				when triSetup_InvWAddZ0 => -- 30 -- add z0 + zOffset
					FPU_ADD_A <= FPU_MUL_OUT;
					FPU_ADD_B <= std_logic_vector(currentStateBlock.ViewportZOffset);

					FPU_MUL_GO <= '0';

					v0_zPosFloat <= f32(FPU_MUL_OUT);

					v1_xPosFloat <= f32(FPU_ADD_OUT);
					currentState <= triSetup_InvWAddZ1;

				when triSetup_InvWAddZ1 => -- 31 -- add z1 + zOffset
					FPU_ADD_A <= FPU_MUL_OUT;

					v1_zPosFloat <= f32(FPU_MUL_OUT);

					v2_xPosFloat <= f32(FPU_ADD_OUT);
					currentState <= triSetup_InvWAddZ2;

				when triSetup_InvWAddZ2 => -- 32 -- add z2 + zOffset
					FPU_ADD_A <= FPU_MUL_OUT;

					v2_zPosFloat <= f32(FPU_MUL_OUT);

					v0_yPosFloat <= f32(FPU_ADD_OUT);
					currentState <= triSetup_QuantizeSnapToGridX0;

				when triSetup_QuantizeSnapToGridX0 => -- 33 -- cnv_F_to_I16_rne x0; mul a0 * rcp_w0
					FPU_CNV_A <= std_logic_vector(v0_xPosFloat);
					FPU_CNV_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_I16_RoundNearestEven), 3) );
					FPU_CNV_GO <= '1';

					FPU_MUL_A <= std_logic_vector(v0_store_RGBA.a);
					FPU_MUL_GO <= '1';

					FPU_ADD_GO <= '0';

					if (skipZOffset = '0') then
						v1_yPosFloat <= f32(FPU_ADD_OUT);
						v0_store_RGBA.r <= f32(FPU_MUL_OUT);
					else
						v0_zPosFloat <= f32(FPU_MUL_OUT);
						v1_xPosFloat <= f32(FPU_ADD_OUT);
					end if;

					currentState <= triSetup_QuantizeSnapToGridX1;

				when triSetup_QuantizeSnapToGridX1 => -- 34 -- cnv_F_to_I16_rne x1; mul tx0 * rcp_w0
					FPU_CNV_A <= std_logic_vector(v1_xPosFloat);

					FPU_MUL_A <= std_logic_vector(t0_store_x);

					if (skipZOffset = '0') then
						v2_yPosFloat <= f32(FPU_ADD_OUT);
						v0_store_RGBA.g <= f32(FPU_MUL_OUT);
					else
						v1_zPosFloat <= f32(FPU_MUL_OUT);
						v2_xPosFloat <= f32(FPU_ADD_OUT);
					end if;

					currentState <= triSetup_QuantizeSnapToGridX2;

				when triSetup_QuantizeSnapToGridX2 => -- 35 -- cnv_F_to_I16_rne x2; mul ty0 * rcp_w0
					FPU_CNV_A <= std_logic_vector(v2_xPosFloat);

					FPU_MUL_A <= std_logic_vector(t0_store_y);

					if (skipZOffset = '0') then
						v0_zPosFloat <= f32(FPU_ADD_OUT);
						v0_store_RGBA.b <= f32(FPU_MUL_OUT);
					else
						v2_zPosFloat <= f32(FPU_MUL_OUT);
						v0_yPosFloat <= f32(FPU_ADD_OUT);
					end if;

					currentState <= triSetup_QuantizeSnapToGridY0;

				when triSetup_QuantizeSnapToGridY0 => -- 36 -- cnv_F_to_I16_rne y0; mul r1 * rcp_w1; rcp z0
					FPU_CNV_A <= std_logic_vector(v0_yPosFloat);

					FPU_MUL_A <= std_logic_vector(v1_store_RGBA.r);
					FPU_MUL_B <= std_logic_vector(v1_store_invW);

					v0_store_Z0 <= v0_zPosFloat;

					if (skipZOffset = '0') then
						v1_zPosFloat <= f32(FPU_ADD_OUT);
					else
						v1_yPosFloat <= f32(FPU_ADD_OUT);
						v0_store_RGBA.r <= f32(FPU_MUL_OUT);
					end if;

					currentState <= triSetup_QuantizeSnapToGridY1;

				when triSetup_QuantizeSnapToGridY1 => -- 37 -- cnv_F_to_I16_rne y1; mul g1 * rcp_w1; rcp z1
					FPU_CNV_A <= std_logic_vector(v1_yPosFloat);

					v0_x <= signed(FPU_CNV_OUT(15 downto 0) );

					FPU_MUL_A <= std_logic_vector(v1_store_RGBA.g);

					v1_store_Z10 <= v1_zPosFloat;

					if (skipZOffset = '0') then
						v2_zPosFloat <= f32(FPU_ADD_OUT);
					else
						v2_yPosFloat <= f32(FPU_ADD_OUT);
						v0_store_RGBA.g <= f32(FPU_MUL_OUT);
					end if;

					currentState <= triSetup_QuantizeSnapToGridY2;

				when triSetup_QuantizeSnapToGridY2 => -- 38 -- cnv_F_to_I16_rne y2; mul b1 * rcp_w1; rcp z2
					FPU_CNV_A <= std_logic_vector(v2_yPosFloat);

					v1_x <= signed(FPU_CNV_OUT(15 downto 0) );

					if (skipZOffset = '1') then
						v0_store_RGBA.b <= f32(FPU_MUL_OUT);
					end if;

					FPU_MUL_A <= std_logic_vector(v1_store_RGBA.b);

					v2_store_Z20 <= v2_zPosFloat;
					currentState <= triSetup_QuantizeSnapToGridWait0;

				when triSetup_QuantizeSnapToGridWait0 => -- 39 -- mul a1 * rcp_w1
					FPU_CNV_GO <= '0';

					FPU_MUL_A <= std_logic_vector(v1_store_RGBA.a);

					v0_store_RGBA.a <= f32(FPU_MUL_OUT);

					v2_x <= signed(FPU_CNV_OUT(15 downto 0) );
					currentState <= triSetup_QuantizeSnapToGridWait1;

				when triSetup_QuantizeSnapToGridWait1 => -- 40 -- mul tx1 * rcp_w1
					v0_y <= signed(FPU_CNV_OUT(15 downto 0) );

					FPU_MUL_A <= std_logic_vector(t1_store_x);

					t0_store_x <= f32(FPU_MUL_OUT);
					currentState <= triSetup_QuantizeSnapToGridWait2;

				when triSetup_QuantizeSnapToGridWait2 => -- 41 -- mul ty1 * rcp_w1
					v1_y <= signed(FPU_CNV_OUT(15 downto 0) );

					FPU_MUL_A <= std_logic_vector(t1_store_y);

					t0_store_y <= f32(FPU_MUL_OUT);
					currentState <= triSetup_QuantizeSnapToGridWait3;

				when triSetup_QuantizeSnapToGridWait3 => -- 42 -- mul r2 * rcp_w2
					v2_y <= signed(FPU_CNV_OUT(15 downto 0) );

					FPU_MUL_A <= std_logic_vector(v2_store_RGBA.r);
					FPU_MUL_B <= std_logic_vector(v2_store_invW);

					v1_store_RGBA.r <= f32(FPU_MUL_OUT);
					currentState <= triSetup_duplicateVertexCull;

				when triSetup_duplicateVertexCull => -- 43 -- mul g2 * rcp_w2
					FPU_MUL_A <= std_logic_vector(v2_store_RGBA.g);

					v1_store_RGBA.g <= f32(FPU_MUL_OUT);

					if ( ( (v0_x = v1_x) and (v0_y = v1_y) ) or -- v0 = v1
						( (v1_x = v2_x) and (v1_y = v2_y) ) or -- v1 = v2
						( (v0_x = v2_x) and (v0_y = v2_y) ) ) then -- v0 = v2
						stats_totalTrianglesDuplicateVertCulled <= stats_totalTrianglesDuplicateVertCulled + 1;
						if (hasBroadcastStartForDrawID = '1') then
							readyForNextTriSig <= '1';
							currentState <= triSetup_waitForTriData;
						else
							currentState <= triSetup_broadcastNewDrawEventEmptyTriangle;
						end if;
					else
						currentState <= triSetup_bounds;
					end if;

				-- Compute quad bounds first:
				when triSetup_bounds => -- 44 -- mul b2 * rcp_w2
					FPU_MUL_A <= std_logic_vector(v2_store_RGBA.b);

					v1_store_RGBA.b <= f32(FPU_MUL_OUT);

					minX <= boundsMin(v0_x, v1_x, v2_x);
					maxX <= boundsMax(v0_x, v1_x, v2_x);
					minY <= boundsMin(v0_y, v1_y, v2_y);
					maxY <= boundsMax(v0_y, v1_y, v2_y);
					currentState <= triSetup_boundsClamp;

				when triSetup_boundsClamp => -- 45 -- mul a2 * rcp_w2
					FPU_MUL_A <= std_logic_vector(v2_store_RGBA.a);

					v1_store_RGBA.a <= f32(FPU_MUL_OUT);

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
				when triSetup_boundsCull => -- 46 -- mul tx2 * rcp_w2
					FPU_MUL_A <= std_logic_vector(t2_store_x);

					t1_store_x <= f32(FPU_MUL_OUT);

					if ( (minX >= maxX) or (minY >= maxY) ) then
						stats_totalTrianglesZeroAreaBoundsCulled <= stats_totalTrianglesZeroAreaBoundsCulled + 1;
						if (hasBroadcastStartForDrawID = '1') then
							readyForNextTriSig <= '1';
							currentState <= triSetup_waitForTriData;
						else
							currentState <= triSetup_broadcastNewDrawEventEmptyTriangle;
						end if;
					else
						currentState <= triSetup_crossProduct;
					end if;

				-- twiceTriangleArea = (i1.x - i0.x) * (i2.y - i0.y) - (i1.y - i0.y) * (i2.x - i0.x)
				-- twiceTriangleArea = sub0 * sub1 - sub2 * sub3
				-- twiceTriangleArea = prod0 - prod1
				when triSetup_crossProduct => -- 47 -- mul ty2 * rcp_w2
					FPU_MUL_A <= std_logic_vector(t2_store_y);

					t1_store_y <= f32(FPU_MUL_OUT);

					crossProdSub0 <= resize(v1_x, 32) - resize(v0_x, 32); -- (i1.x - i0.x)
					crossProdSub1 <= resize(v2_y, 32) - resize(v0_y, 32); -- (i2.y - i0.y)
					crossProdSub2 <= resize(v1_y, 32) - resize(v0_y, 32); -- (i1.y - i0.y)
					crossProdSub3 <= resize(v2_x, 32) - resize(v0_x, 32); -- (i2.x - i0.x)
					currentState <= triSetup_crossProduct2;

				when triSetup_crossProduct2 =>
					FPU_MUL_GO <= '0';

					v2_store_RGBA.r <= f32(FPU_MUL_OUT);

					crossProdProd0 <= crossProdSub0 * crossProdSub1;
					crossProdProd1 <= crossProdSub2 * crossProdSub3;
					currentState <= triSetup_crossProduct4;

				when triSetup_crossProduct4 =>
					v2_store_RGBA.g <= f32(FPU_MUL_OUT);

					twiceTriangleArea <= resize(crossProdProd0, 32) - resize(crossProdProd1, 32);
					currentState <= triSetup_backfaceCull;

				-- Backface cull if the triangle has a negative area (facing away from the screen) or
				-- if it has zero area (too small)
				when triSetup_backfaceCull =>
					v2_store_RGBA.b <= f32(FPU_MUL_OUT);

					if (twiceTriangleArea(31) = '1') then -- Backface culling if we have a negative triangle area (topmost sign bit set)
						stats_totalTrianglesBackfaceCulled <= stats_totalTrianglesBackfaceCulled + 1;
						if (hasBroadcastStartForDrawID = '1') then
							readyForNextTriSig <= '1';
							currentState <= triSetup_waitForTriData;
						else
							currentState <= triSetup_broadcastNewDrawEventEmptyTriangle;
						end if;
					elsif (twiceTriangleArea = 0) then -- Zero area culling
						stats_totalTrianglesZeroAreaTriCulled <= stats_totalTrianglesZeroAreaTriCulled + 1;
						if (hasBroadcastStartForDrawID = '1') then
							readyForNextTriSig <= '1';
							currentState <= triSetup_waitForTriData;
						else
							currentState <= triSetup_broadcastNewDrawEventEmptyTriangle;
						end if;
					else
						if (TEXCFG_nointerpolation = '1') then
							currentState <= triSetup_topLeftBiasA;
						else
							currentState <= triSetup_sendToRecip;
						end if;
					end if;

				when triSetup_sendToRecip =>
					v2_store_RGBA.a <= f32(FPU_MUL_OUT);


					FPU_CNV_A <= std_logic_vector('0' & twiceTriangleArea(30 downto 0) );
					FPU_CNV_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(U32_to_F), 3) );
					FPU_CNV_GO <= '1'; -- Issue the uint32 -> float conversion on the FPU (takes 3 cycles to complete)
					currentState <= triSetup_waitForConvert0;

				when triSetup_waitForConvert0 =>
					t2_store_x <= f32(FPU_MUL_OUT);

					FPU_CNV_GO <= '0'; -- Deassert after one clock cycle
					currentState <= triSetup_waitForConvert1;

				when triSetup_waitForConvert1 =>
					t2_store_y <= f32(FPU_MUL_OUT);

					currentState <= triSetup_waitForConvert2;

				when triSetup_waitForConvert2 =>
					currentState <= triSetup_setupRecip;

				when triSetup_setupRecip =>
					FPU_SPEC_A <= FPU_CNV_OUT; -- Feed the results of the converted uint32 right back into the input again so we can take the reciprocal
					FPU_SPEC_GO <= '1'; -- Kick off the floating point reciprocal calculation (takes a whopping 14 cycles to complete)
					reciprocalCycleCounter <= to_unsigned(SPEC_CYCLES, 4);

					twiceTriangleAreaFloat <= unsigned(FPU_CNV_OUT);
					currentState <= triSetup_topLeftBiasA;

				when triSetup_topLeftBiasA =>
					FPU_SPEC_GO <= '0'; -- Deassert after one clock cycle
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
					leftFirstTermInner0 <= resize(v2_x, 32) - resize(v1_x, 32);
					leftFirstTermInner1 <= resize(v0_x, 32) - resize(v2_x, 32);
					leftFirstTermInner2 <= resize(v1_x, 32) - resize(v0_x, 32);

					leftSecondTermInner0 <= resize(minY, 32) - resize(v1_y, 32);
					leftSecondTermInner1 <= resize(minY, 32) - resize(v2_y, 32);
					leftSecondTermInner2 <= resize(minY, 32) - resize(v0_y, 32);

					rightFirstTermInner0 <= resize(v2_y, 32) - resize(v1_y, 32);
					rightFirstTermInner1 <= resize(v0_y, 32) - resize(v2_y, 32);
					rightFirstTermInner2 <= resize(v1_y, 32) - resize(v0_y, 32);

					rightSecondTermInner0 <= resize(minX, 32) - resize(v1_x, 32);
					rightSecondTermInner1 <= resize(minX, 32) - resize(v2_x, 32);
					rightSecondTermInner2 <= resize(minX, 32) - resize(v0_x, 32);

					reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					currentState <= triSetup_leftProduct0;

				-- 32-bit signed integer multiplication to 64 bit signed integer product (we're starting one signed multiplication per cycle)
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
					barycentricRowResetA <= resize(leftProduct0, 32) - resize(rightProduct0, 32);
					barycentricRowResetB <= resize(leftProduct1, 32) - resize(rightProduct1, 32);
					barycentricRowResetC <= resize(leftProduct2, 32) - resize(rightProduct2, 32);
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
						barycentricInverse <= f32(FPU_SPEC_OUT);
						currentState <= triSetup_calculateTX10Delta;
					else
						reciprocalCycleCounter <= reciprocalCycleCounter - 1;
					end if;

				when triSetup_calculateTX10Delta => -- tx10 = tx1 - tx0
					FPU_ADD_A <= std_logic_vector(t1_store_x);
					FPU_ADD_B <= std_logic_vector(NegateFloat(t0_store_x) );
					FPU_ADD_GO <= '1';
					currentState <= triSetup_calculateTX20Delta;

				when triSetup_calculateTX20Delta => -- tx20 = tx2 - tx0
					FPU_ADD_A <= std_logic_vector(t2_store_x);
					currentState <= triSetup_calculateTY10Delta;

				when triSetup_calculateTY10Delta => -- ty10 = ty1 - ty0
					FPU_ADD_A <= std_logic_vector(t1_store_y);
					FPU_ADD_B <= std_logic_vector(NegateFloat(t0_store_y) );
					currentState <= triSetup_calculateTY20Delta;

				when triSetup_calculateTY20Delta => -- ty20 = ty2 - ty0
					FPU_ADD_A <= std_logic_vector(t2_store_y);
					currentState <= triSetup_calculateColorR10Delta;

				when triSetup_calculateColorR10Delta => -- colorR10 = colorR1 - colorR0
					FPU_ADD_A <= std_logic_vector(v1_store_RGBA.r);
					FPU_ADD_B <= std_logic_vector(NegateFloat(v0_store_RGBA.r) );
					currentState <= triSetup_calculateColorR20Delta;

				when triSetup_calculateColorR20Delta => -- colorR20 = colorR2 - colorR0
					FPU_ADD_A <= std_logic_vector(v2_store_RGBA.r);
					t1_store_x <= f32(FPU_ADD_OUT); -- tx10
					currentState <= triSetup_calculateColorG10Delta;

				when triSetup_calculateColorG10Delta => -- colorG10 = colorG1 - colorG0
					FPU_ADD_A <= std_logic_vector(v1_store_RGBA.g);
					FPU_ADD_B <= std_logic_vector(NegateFloat(v0_store_RGBA.g) );
					t2_store_x <= f32(FPU_ADD_OUT); -- tx20
					currentState <= triSetup_calculateColorG20Delta;

				when triSetup_calculateColorG20Delta => -- colorG20 = colorG2 - colorG0
					FPU_ADD_A <= std_logic_vector(v2_store_RGBA.g);
					t1_store_y <= f32(FPU_ADD_OUT); -- ty10
					currentState <= triSetup_calculateColorB10Delta;

				when triSetup_calculateColorB10Delta => -- colorB10 = colorB1 - colorB0
					FPU_ADD_A <= std_logic_vector(v1_store_RGBA.b);
					FPU_ADD_B <= std_logic_vector(NegateFloat(v0_store_RGBA.b) );
					t2_store_y <= f32(FPU_ADD_OUT); -- ty20
					currentState <= triSetup_calculateColorB20Delta;

				when triSetup_calculateColorB20Delta => -- colorB20 = colorB2 - colorB0
					FPU_ADD_A <= std_logic_vector(v2_store_RGBA.b);
					v1_store_RGBA.r <= f32(FPU_ADD_OUT); -- colorR10
					currentState <= triSetup_calculateColorA10Delta;

				when triSetup_calculateColorA10Delta => -- colorA10 = colorA1 - colorA0
					FPU_ADD_A <= std_logic_vector(v1_store_RGBA.a);
					FPU_ADD_B <= std_logic_vector(NegateFloat(v0_store_RGBA.a) );
					v2_store_RGBA.r <= f32(FPU_ADD_OUT); -- colorR20
					currentState <= triSetup_calculateColorA20Delta;

				when triSetup_calculateColorA20Delta => -- colorA20 = colorA2 - colorA0
					FPU_ADD_A <= std_logic_vector(v2_store_RGBA.a);
					v1_store_RGBA.g <= f32(FPU_ADD_OUT); -- colorG10
					currentState <= triSetup_calculateZ10Delta;

				when triSetup_calculateZ10Delta => -- Z10 = Z1 - Z0
					FPU_ADD_A <= std_logic_vector(v1_store_Z10);
					FPU_ADD_B <= std_logic_vector(NegateFloat(v0_store_Z0) );
					v2_store_RGBA.g <= f32(FPU_ADD_OUT); -- colorG20
					currentState <= triSetup_calculateZ20Delta;

				when triSetup_calculateZ20Delta => -- Z20 = Z2 - Z0
					FPU_ADD_A <= std_logic_vector(v2_store_Z20);
					v1_store_RGBA.b <= f32(FPU_ADD_OUT); -- colorB10
					currentState <= triSetup_calculateInvW10Delta;

				when triSetup_calculateInvW10Delta => -- invW10 = invW1 - invW0
					FPU_ADD_A <= std_logic_vector(v1_store_invW);
					FPU_ADD_B <= std_logic_vector(NegateFloat(v0_store_invW) );
					v2_store_RGBA.b <= f32(FPU_ADD_OUT); -- colorB20
					currentState <= triSetup_calculateInvW20Delta;

				when triSetup_calculateInvW20Delta => -- invW20 = invW2 - invW0
					FPU_ADD_A <= std_logic_vector(v2_store_invW);
					v1_store_RGBA.a <= f32(FPU_ADD_OUT); -- colorA10
					currentState <= triSetup_waitForDeltasCompletion0;

				when triSetup_waitForDeltasCompletion0 =>
					FPU_ADD_GO <= '0';
					v2_store_RGBA.a <= f32(FPU_ADD_OUT); -- colorA20
					currentState <= triSetup_waitForDeltasCompletion1;
					
				when triSetup_waitForDeltasCompletion1 =>
					v1_store_Z10 <= f32(FPU_ADD_OUT); -- Z10
					currentState <= triSetup_waitForDeltasCompletion2;

				when triSetup_waitForDeltasCompletion2 =>
					v2_store_Z20 <= f32(FPU_ADD_OUT); -- Z20
					currentState <= triSetup_waitForDeltasCompletion3;

				when triSetup_waitForDeltasCompletion3 =>
					v1_store_invW <= f32(FPU_ADD_OUT); -- invW10
					currentState <= triSetup_waitForDeltasCompletion4;

				when triSetup_waitForDeltasCompletion4 =>
					v2_store_invW <= f32(FPU_ADD_OUT); -- invW20
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
						RAST_v0_out_Z <= std_logic_vector(v0_store_Z0);
						RAST_v10_out_Z <= std_logic_vector(v1_store_Z10);
						RAST_v20_out_Z <= std_logic_vector(v2_store_Z20);
						RAST_v0_out_invW <= std_logic_vector(v0_store_invW);
						RAST_v10_out_invW <= std_logic_vector(v1_store_invW);
						RAST_v20_out_invW <= std_logic_vector(v2_store_invW);
						RAST_t0_out_x <= std_logic_vector(t0_store_x);
						RAST_t0_out_y <= std_logic_vector(t0_store_y);
						RAST_t10_out_x <= std_logic_vector(t1_store_x);
						RAST_t10_out_y <= std_logic_vector(t1_store_y);
						RAST_t20_out_x <= std_logic_vector(t2_store_x);
						RAST_t20_out_y <= std_logic_vector(t2_store_y);
						RAST_v0_out_colorRGBA <= std_logic_vector(v0_store_RGBA.a & v0_store_RGBA.b & v0_store_RGBA.g & v0_store_RGBA.r);
						RAST_v10_out_colorRGBA <= std_logic_vector(v1_store_RGBA.a & v1_store_RGBA.b & v1_store_RGBA.g & v1_store_RGBA.r);
						RAST_v20_out_colorRGBA <= std_logic_vector(v2_store_RGBA.a & v2_store_RGBA.b & v2_store_RGBA.g & v2_store_RGBA.r);
						RAST_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
						RAST_outBarycentricInverse <= std_logic_vector(barycentricInverse);
						hasBroadcastStartForDrawID <= '1';
						triSetupDataIsValid <= '1';
					end if;

				when triSetup_broadcastNewDrawEventEmptyTriangle =>
					minY <= (others => '1'); -- Using an inside-out bounds like this will cause the rasterizer to instantly terminate the empty triangle for us
					maxY <= (others => '0');
					currentState <= triSetup_broadcastOutput;

			end case;
		end if;
	end process MainStateMachine;

end Behavioral;
