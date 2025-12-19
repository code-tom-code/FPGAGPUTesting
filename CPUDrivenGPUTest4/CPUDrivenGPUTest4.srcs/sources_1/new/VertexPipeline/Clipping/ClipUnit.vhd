library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.FloatCommon.all;
use work.ClipTypes.all;
use work.ClipCommon.all;
use work.ClipUnitState.all;

entity ClipUnit is
	Port ( clk : in STD_LOGIC;

	-- Control signals for the previous (IA) and next (TRISETUP) stages:
		IA_inPreviousStageIsValid : in STD_LOGIC;
		IA_outPreviousStageIsReady : out STD_LOGIC := '0';

		TRISETUP_outNextStageIsValid : out STD_LOGIC := '0';
		TRISETUP_inNextStageisReady : in STD_LOGIC;

	-- Triangle data in
		IA_inv0x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv0y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv0z : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv0w : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv0rgba : in STD_LOGIC_VECTOR(127 downto 0);
		IA_inv0tx : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv0ty : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv0ClipOutcodes : in STD_LOGIC_VECTOR(10 downto 0);

		IA_inv1x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv1y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv1z : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv1w : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv1rgba : in STD_LOGIC_VECTOR(127 downto 0);
		IA_inv1tx : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv1ty : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv1ClipOutcodes : in STD_LOGIC_VECTOR(10 downto 0);

		IA_inv2x : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv2y : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv2z : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv2w : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv2rgba : in STD_LOGIC_VECTOR(127 downto 0);
		IA_inv2tx : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv2ty : in STD_LOGIC_VECTOR(31 downto 0);
		IA_inv2ClipOutcodes : in STD_LOGIC_VECTOR(10 downto 0);

		IA_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);
		IA_inWholeTriangleAABBIntersectsViewport : in STD_LOGIC;
	-- End Triangle data in

	-- Triangle data out
		TRISETUP_outv0x : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv0y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv0z : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv0w : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv0rgba : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		TRISETUP_outv0tx : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv0ty : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		TRISETUP_outv1x : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv1y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv1z : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv1w : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv1rgba : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		TRISETUP_outv1tx : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv1ty : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		TRISETUP_outv2x : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv2y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv2z : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv2w : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv2rgba : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		TRISETUP_outv2tx : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_outv2ty : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		TRISETUP_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	-- End Triangle data out

	-- FPU interfaces begin
		FPU_Add0_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Add0_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Add0_IADD_GO : out STD_LOGIC := '0';
		FPU_Add0_OUT : in STD_LOGIC_VECTOR(31 downto 0);

		FPU_Add1_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Add1_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Add1_IADD_GO : out STD_LOGIC := '0';
		FPU_Add1_OUT : in STD_LOGIC_VECTOR(31 downto 0);

		FPU_Mul0_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Mul0_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Mul0_IMUL_GO : out STD_LOGIC := '0';
		FPU_Mul0_OUT : in STD_LOGIC_VECTOR(31 downto 0);

		FPU_Mul1_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Mul1_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Mul1_IMUL_GO : out STD_LOGIC := '0';
		FPU_Mul1_OUT : in STD_LOGIC_VECTOR(31 downto 0);

		FPU_Rcp0_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Rcp0_ISPEC_GO : out STD_LOGIC := '0';
		FPU_Rcp0_OUT : in STD_LOGIC_VECTOR(31 downto 0);
	-- FPU interfaces end

	-- Clip Unit State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(CLIP_UNIT_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- Clip Unit State Block interface end

	-- Command Processor interface begin
		CMD_IsIdle : out STD_LOGIC := '0';
	-- Command Processor interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_CurrentState : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_CurrentClipPlane : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_CurrentClipBitmask : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_ChildTriStackSize : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_ClipDistance0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_ClipDistance1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_TriangleIntersectsViewport : out STD_LOGIC := '0';
		DBG_V0PosX : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V0PosY : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V0PosZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V0PosW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V1PosX : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V1PosY : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V1PosZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V1PosW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V2PosX : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V2PosY : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V2PosZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_V2PosW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_ClipOutcodes0 : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		DBG_ClipOutcodes1 : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		DBG_ClipOutcodes2 : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		DBG_AlreadyClippedPlanes : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0')
		);
end ClipUnit;

architecture Behavioral of ClipUnit is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

	component AABB2DOverlapViewport
		port(
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
	end component;

	type clipper_state_t is (
		idleState, -- 0
		clip_computeClipMask, -- 1
		clip_computeClipDistance0, -- Issue first add/sub (insideW +/- insideAxis) and (outsideW +/- outsideAxis) -- 2
		clip_computeClipDistance1, -- Issue second add/sub (insideW +/- insideAxis) and (outsideW +/- outsideAxis) -- 3
		clip_computeClipDistance2, -- Wait for first issue to complete -- 4
		clip_computeClipDistance3, -- Wait for first issue to complete -- 5
		clip_computeClipDistance4, -- Wait for first issue to complete -- 6
		clip_computeClipDistance5, -- Issue next first stage sub (insideWAxis - outsideWAxis) -- 7
		clip_computeClipDistance6, -- Issue next second stage sub (insideWAxis - outsideWAxis) -- 8
		clip_computeClipDistance7, -- Wait for next issue to complete -- 9
		clip_computeClipDistance8, -- Wait for next issue to complete -- 10
		clip_computeClipDistance9, -- Wait for next issue to complete -- 11
		clip_computeClipDistance10, -- Issue first reciprocal (1.0 / (insideWAxis - outsideWAxis) ) -- 12
		clip_computeClipDistance11, -- Issue second reciprocal (1.0 / (insideWAxis - outsideWAxis) ) -- 13
		clip_computeClipDistance12, -- Wait for reciprocals to complete -- 14
		clip_computeClipDistance13, -- Wait for reciprocals to complete -- 15
		clip_computeClipDistance14,	-- Wait for reciprocals to complete -- 16
		clip_computeClipDistance15,	-- Wait for reciprocals to complete -- 17
		clip_computeClipDistance16,	-- Wait for reciprocals to complete -- 18
		clip_computeClipDistance17,	-- Wait for reciprocals to complete -- 19
		clip_computeClipDistance18,	-- Wait for reciprocals to complete -- 20
		clip_computeClipDistance19,	-- Wait for reciprocals to complete -- 21
		clip_computeClipDistance20,	-- Wait for reciprocals to complete -- 22
		clip_computeClipDistance21,	-- Wait for reciprocals to complete -- 23
		clip_computeClipDistance22,	-- Wait for reciprocals to complete -- 24
		clip_computeClipDistance23,	-- Wait for reciprocals to complete -- 25
		clip_computeClipDistance24,	-- Wait for reciprocals to complete -- 26
		clip_computeClipDistance25, -- Use first reciprocal result to issue the first multiply (insideWAxis / (insideWAxis - outsideWAxis) ) -- 27
		clip_computeClipDistance26, -- Use second reciprocal result to issue the second multiply (insideWAxis / (insideWAxis - outsideWAxis) ) -- 28
		clip_computeClipDistance27, -- Wait for multiplies to complete -- 29
		clip_computeClipDistance28, -- Wait for multiplies to complete -- 30
		clip_computeClipDistance29,	-- Wait for multiplies to complete -- 31
		clip_computeClipDistance30,	-- Wait for multiplies to complete -- 32
		clip_computeClipDistance31, -- Store first clip distance, calc invClipDistance -- 33
		clip_computeClipDistance32, -- Store second clip distance, calc invClipDistance -- 34
		clip_computeClipDistance33, -- Wait for subtracts to complete -- 35
		clip_computeClipDistance34, -- Wait for subtracts to complete -- 36
		clip_computeClipDistance35, -- Wait for subtracts to complete -- 37
		clip_computeClipDistance36, -- Store first invClipDistance -- 38
		clip_computeClipDistance37, -- Store second invClipDistance -- 39
		clip_clipVertInPlace0, -- 40
		clip_clipVertInPlace1, -- 41
		clip_clipVertInPlace2, -- 42
		clip_clipVertInPlace3, -- 43
		clip_clipVertInPlace4, -- 44
		clip_clipVertInPlace5, -- 45
		clip_clipVertInPlace6, -- 46
		clip_clipVertInPlace7, -- 47
		clip_clipVertInPlace8, -- 48
		clip_clipVertInPlace9, -- 49
		clip_clipVertInPlace10, -- 50
		clip_clipVertInPlace11, -- 51
		clip_clipVertInPlace12, -- 52
		clip_clipVertInPlace13, -- 53
		clip_clipVertInPlace14, -- 54
		clip_clipVertInPlace15, -- 55
		clip_clipVertInPlace16, -- 56
		clip_clipVertInPlace17, -- 57
		clip_clipVertInPlace18, -- 58
		clip_clipVertInPlace19, -- 59
		clip_clipVertInPlace20, -- 60
		clip_clipVertInPlace21, -- 61
		clip_clipVertInPlace22, -- 62
		clip_clipVertInPlace23, -- 63
		clip_clipVertInPlace24, -- 64
		clip_clipVertInPlace25, -- 65
		clip_clipVertInPlace26, -- 66
		clip_clipVertInPlace27, -- 67
		clip_clipVertInPlace28, -- 68
		clip_clipVertInPlace29, -- 69
		clip_clipVertInPlace30, -- 70
		clip_reconstructTriangles, -- 71
		clip_recomputeClipOutcodes, -- 72
		clip_finishOrNextPlane, -- 73
		clip_sendToNextStage, -- 74
		clip_popNextChildTriangle0, -- 75
		clip_popNextChildTriangle1, -- 76
		clip_sendNewDrawEventID, -- 77
		clip_setNewClipState -- 78
		);

	-- Returns "true" if this triangle should be discarded due to being culled, or "false" otherwise
	pure function ShouldDiscardTriangleCulled(v0outcodes : VertexAllClipCodes; v1outcodes : VertexAllClipCodes; v2outcodes : VertexAllClipCodes) return boolean is
		variable combinedClipCodes : VertexAllClipCodes;
	begin
		combinedClipCodes := v0outcodes and v1outcodes and v2outcodes;

		-- Note that we need to test both the GB and regular viewport bits here because due to the weirdness of -w vertices in a triangle, it's possible for a triangle to be
		-- entirely outside of one of the GB edges without being entirely outside of its corresponding viewport edge.
		return combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneRight) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneLeft) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneTop) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneBottom) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneZNear) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneZFar) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneRightGB) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneLeftGB) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneTopGB) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneBottomGB) ) = '1' or
			combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneW0) ) = '1';
	end function;

	pure function ShouldDiscardTriangleInfNaNCulled(v0x : f32; v0y : f32; v0z : f32; v0w : f32;
		v1x : f32; v1y : f32; v1z : f32; v1w : f32;
		v2x : f32; v2y : f32; v2z : f32; v2w : f32) return boolean is
	begin
		return GetFloatIsReal(v0x) = '0' or GetFloatIsReal(v0y) = '0' or GetFloatIsReal(v0z) = '0' or GetFloatIsReal(v0w) = '0' or
			GetFloatIsReal(v1x) = '0' or GetFloatIsReal(v1y) = '0' or GetFloatIsReal(v1z) = '0' or GetFloatIsReal(v1w) = '0' or
			GetFloatIsReal(v2x) = '0' or GetFloatIsReal(v2y) = '0' or GetFloatIsReal(v2z) = '0' or GetFloatIsReal(v2w) = '0';
	end function;

	pure function GetNextPlaneNeedsClipping(v0outcodes : VertexAllClipCodes; v1outcodes : VertexAllClipCodes; v2outcodes : VertexAllClipCodes; inTriAABBIntersectsViewport : std_logic) return ClipPlaneEnum is
		variable combinedClipCodes : VertexAllClipCodes;
	begin
		combinedClipCodes := v0outcodes or v1outcodes or v2outcodes;
		if (combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneZNear) ) = '1') then
			return ClipPlaneZNear;
		end if;
		if (combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneZFar) ) = '1') then
			return ClipPlaneZFar;
		end if;
		if (inTriAABBIntersectsViewport = '1') then
			if (combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneLeftGB) ) = '1') then
				return ClipPlaneLeftGB;
			end if;
			if (combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneRightGB) ) = '1') then
				return ClipPlaneRightGB;
			end if;
			if (combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneBottomGB) ) = '1') then
				return ClipPlaneBottomGB;
			end if;
			if (combinedClipCodes(ClipPlaneEnum'pos(ClipPlaneTopGB) ) = '1') then
				return ClipPlaneTopGB;
			end if;
		end if;
		return ClipDone;
	end function;

	pure function GetOutcodeBitmapForPlane(v0ClipOutcodes : VertexAllClipCodes; v1ClipOutcodes : VertexAllClipCodes; v2ClipOutcodes : VertexAllClipCodes; clipPlane : ClipPlaneEnum) return std_logic_vector is
	begin
		return v2ClipOutcodes(ClipPlaneEnum'pos(clipPlane) ) & v1ClipOutcodes(ClipPlaneEnum'pos(clipPlane) ) & v0ClipOutcodes(ClipPlaneEnum'pos(clipPlane) );
	end function;

	-- Returns true if this triangle needs to be clipped, or false if we can skip clipping on it entirely!
	pure function DoesTriangleNeedClipping(v0ClipOutcodes : VertexAllClipCodes; v1ClipOutcodes : VertexAllClipCodes; v2ClipOutcodes : VertexAllClipCodes; inWholeTriangleAABBIntersectsViewport : std_logic) return boolean is
		variable combinedOutcodes : VertexAllClipCodes;
	begin
		combinedOutcodes := v0ClipOutcodes or v1ClipOutcodes or v2ClipOutcodes;
		if (combinedOutcodes(ClipPlaneEnum'pos(ClipPlaneZNear) ) = '1' or combinedOutcodes(ClipPlaneEnum'pos(ClipPlaneZFar) ) = '1') then
			return true;
		end if;

		if (combinedOutcodes(ClipPlaneEnum'pos(ClipPlaneLeftGB) ) = '1' or combinedOutcodes(ClipPlaneEnum'pos(ClipPlaneRightGB) ) = '1' or 
			combinedOutcodes(ClipPlaneEnum'pos(ClipPlaneTopGB) ) = '1' or combinedOutcodes(ClipPlaneEnum'pos(ClipPlaneBottomGB) ) = '1') then
			return inWholeTriangleAABBIntersectsViewport = '1';
		end if;

		return false;
	end function;

	pure function ClampXToClippedPlanes(alreadyClippedPlanes : VertexAllClipCodes; xPos : f32; wPos : f32) return f32 is
	begin
		if (alreadyClippedPlanes(ClipPlaneEnum'pos(ClipPlaneLeftGB) ) = '1') then
			if (FloatLessThanFloat(xPos, FloatShiftX16(FloatNegate(wPos) ) ) ) then
				return FloatShiftX16(FloatNegate(wPos) );
			end if;
		end if;
		if (alreadyClippedPlanes(ClipPlaneEnum'pos(ClipPlaneRightGB) ) = '1') then
			if (FloatGreaterThanFloat(xPos, FloatShiftX16(wPos) ) ) then
				return FloatShiftX16(wPos);
			end if;
		end if;
		return xPos;
	end function;

	pure function ClampYToClippedPlanes(alreadyClippedPlanes : VertexAllClipCodes; yPos : f32; wPos : f32) return f32 is
	begin
		if (alreadyClippedPlanes(ClipPlaneEnum'pos(ClipPlaneBottomGB) ) = '1') then
			if (FloatLessThanFloat(yPos, FloatShiftX32(FloatNegate(wPos) ) ) ) then
				return FloatShiftX32(FloatNegate(wPos) );
			end if;
		end if;
		if (alreadyClippedPlanes(ClipPlaneEnum'pos(ClipPlaneTopGB) ) = '1') then
			if (FloatGreaterThanFloat(yPos, FloatShiftX32(wPos) ) ) then
				return FloatShiftX32(wPos);
			end if;
		end if;
		return yPos;
	end function;

	pure function ClampZToClippedPlanes(alreadyClippedPlanes : VertexAllClipCodes; zPos : f32; wPos : f32) return f32 is
	begin
		if (alreadyClippedPlanes(ClipPlaneEnum'pos(ClipPlaneZNear) ) = '1') then
			if (GetFloatIsNegative(zPos) = '1') then
				return X"00000000";
			end if;
		end if;
		if (alreadyClippedPlanes(ClipPlaneEnum'pos(ClipPlaneZFar) ) = '1') then
			if (FloatGreaterThanFloat(zPos, wPos) ) then
				return wPos;
			end if;
		end if;
		return zPos;
	end function;

	pure function ClampW(wPos : f32) return f32 is
	begin
		if (FloatLessThanFloat(wPos, W_CLIP_EPSILON) ) then
			return W_CLIP_EPSILON;
		end if;
		return wPos;
	end function;

	type vertData is record
		x : f32;
		y : f32;
		z : f32;
		w : f32;
		r : f32;
		g : f32;
		b : f32;
		a : f32;
		tx : f32;
		ty : f32;
	end record vertData;

	type triData is record
		tri_v0 : vertData;
		tri_v1 : vertData;
		tri_v2 : vertData;
		childAlreadyClippedPlanes : VertexAllClipCodes;
	end record triData;

	type triDataStack is array(0 to 6) of triData;

	procedure PushTriangleStack(signal stack : inout triDataStack; signal stackSize : inout unsigned(2 downto 0) ) is
	begin
		stack(6) <= stack(5);
		stack(5) <= stack(4);
		stack(4) <= stack(3);
		stack(3) <= stack(2);
		stack(2) <= stack(1);
		stack(1) <= stack(0);

		stackSize <= stackSize + 1;
	end procedure;

	procedure PopTriangleStack(signal stack : inout triDataStack; signal stackSize : inout unsigned(2 downto 0) ) is
	begin
		stack(0) <= stack(1);
		stack(1) <= stack(2);
		stack(2) <= stack(3);
		stack(3) <= stack(4);
		stack(4) <= stack(5);
		stack(5) <= stack(6);

		stackSize <= stackSize - 1;
	end procedure;
	
signal currentState : clipper_state_t := idleState;
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');
signal hasSentCurrentDrawEventID : std_logic := '0';
signal prevStageReady : std_logic := '0';
signal nextStageValid : std_logic := '0';

signal insideWAxis0 : f32 := (others => '0');
signal insideWAxis1 : f32 := (others => '0');

signal clipDistance0 : f32 := (others => '0'); -- The distance in clipspace from the current clipping plane for outsideVert0
signal clipDistance1 : f32 := (others => '0'); -- The distance in clipspace from the current clipping plane for outsideVert1
signal clipDistanceInv0 : f32 := (others => '0'); -- This is (1.0f - clipDistance0)
signal clipDistanceInv1 : f32 := (others => '0'); -- This is (1.0f - clipDistance1)

signal v0 : vertData;
signal v1 : vertData;
signal v2 : vertData;
signal v0ClipOutcodes : VertexAllClipCodes := (others => '0');
signal v1ClipOutcodes : VertexAllClipCodes := (others => '0');
signal v2ClipOutcodes : VertexAllClipCodes := (others => '0');

signal triAABBIntersectsViewport : std_logic := '0';

signal storedTriData : triDataStack;
signal triDataStackSize : unsigned(2 downto 0) := (others => '0');

signal clipSplitState : std_logic_vector(2 downto 0) := (others => '0');
signal currentClipPlane : ClipPlaneEnum := ClipDone; -- This is the plane that we are currently in the process of clipping
signal currentTriAlreadyClippedPlanes : VertexAllClipCodes := (others => '0');
signal clipDistanceLine0 : f32 := (others => '0');
signal clipDistanceLine1 : f32 := (others => '0');

signal insideVert0 : vertData;
signal insideVert1 : vertData;
signal outsideVert0 : vertData;
signal outsideVert1 : vertData;

signal currentStateBlock : sClipUnitState := DEFAULT_CLIP_UNIT_STATE;

-- Numerical stats (triangle count and clip count stats):
signal stats_TrianglesInputToClipCullUnit : unsigned(11 downto 0) := (others => '0');
signal stats_TrianglesOutputFromClipCullUnit : unsigned(11 downto 0) := (others => '0');
signal stats_TrianglesPassedNoClipping : unsigned(11 downto 0) := (others => '0');
signal stats_ChildTrianglesGeneratedFromClipping : unsigned(11 downto 0) := (others => '0');
signal stats_ClipsAgainstZNearPlane : unsigned(11 downto 0) := (others => '0');
signal stats_ClipsAgainstZFarPlane : unsigned(11 downto 0) := (others => '0');
signal stats_ClipsAgainstGBLeftPlane : unsigned(11 downto 0) := (others => '0');
signal stats_ClipsAgainstGBRightPlane : unsigned(11 downto 0) := (others => '0');
signal stats_ClipsAgainstGBTopPlane : unsigned(11 downto 0) := (others => '0');
signal stats_ClipsAgainstGBBottomPlane : unsigned(11 downto 0) := (others => '0');

-- Cycle counter stats:
signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

instClipUnit_AABB2DOverlapViewport : AABB2DOverlapViewport port map (inv0x => std_logic_vector(v0.x), inv0y => std_logic_vector(v0.y), 
	inv1x => std_logic_vector(v1.x), inv1y => std_logic_vector(v1.y), 
	inv2x => std_logic_vector(v2.x), inv2y => std_logic_vector(v2.y), 
	outWholeTriangleAABBIntersectsViewport => triAABBIntersectsViewport);

IA_outPreviousStageIsReady <= prevStageReady;
TRISETUP_outNextStageIsValid <= nextStageValid;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_CurrentState <= std_logic_vector(to_unsigned(clipper_state_t'pos(currentState), 8) );
DBG_CurrentClipPlane <= std_logic_vector(to_unsigned(ClipPlaneEnum'pos(currentClipPlane), 4) );
DBG_CurrentClipBitmask <= clipSplitState;
DBG_ChildTriStackSize <= std_logic_vector(triDataStackSize);
DBG_ClipDistance0 <= std_logic_vector(clipDistance0);
DBG_ClipDistance1 <= std_logic_vector(clipDistance1);
DBG_V0PosX <= std_logic_vector(v0.x);
DBG_V0PosY <= std_logic_vector(v0.y);
DBG_V0PosZ <= std_logic_vector(v0.z);
DBG_V0PosW <= std_logic_vector(v0.w);
DBG_V1PosX <= std_logic_vector(v1.x);
DBG_V1PosY <= std_logic_vector(v1.y);
DBG_V1PosZ <= std_logic_vector(v1.z);
DBG_V1PosW <= std_logic_vector(v1.w);
DBG_V2PosX <= std_logic_vector(v2.x);
DBG_V2PosY <= std_logic_vector(v2.y);
DBG_V2PosZ <= std_logic_vector(v2.z);
DBG_V2PosW <= std_logic_vector(v2.w);
DBG_ClipOutcodes0 <= v0ClipOutcodes;
DBG_ClipOutcodes1 <= v1ClipOutcodes;
DBG_ClipOutcodes2 <= v2ClipOutcodes;
DBG_TriangleIntersectsViewport <= triAABBIntersectsViewport;
DBG_AlreadyClippedPlanes <= currentTriAlreadyClippedPlanes;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
			case currentState is
				when idleState =>
					statCyclesIdle <= statCyclesIdle + 1;

				when clip_sendToNextStage =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	process(clk)
		variable newDrawEventIDClear : std_logic;
	begin
		if (rising_edge(clk) ) then
			prevStageReady <= '0';
			nextStageValid <= '0';
			STATE_ConsumeStateSlot <= '0';

			case currentState is
				when idleState =>
					FPU_Add0_IADD_GO <= '0';
					FPU_Add1_IADD_GO <= '0';
					FPU_Mul0_IMUL_GO <= '0';
					FPU_Mul1_IMUL_GO <= '0';
					FPU_Rcp0_ISPEC_GO <= '0';
					CMD_IsIdle <= '0';

					currentClipPlane <= GetNextPlaneNeedsClipping(IA_inv0ClipOutcodes, IA_inv1ClipOutcodes, IA_inv2ClipOutcodes, IA_inWholeTriangleAABBIntersectsViewport);
					currentTriAlreadyClippedPlanes <= (others => '0'); -- Make sure to reset our already clipped planes bitmap each time we receive a new triangle!

					v0.x <= f32(IA_inv0x);
					v0.y <= f32(IA_inv0y);
					v0.z <= f32(IA_inv0z);
					v0.w <= f32(IA_inv0w);
					v0.r <= f32(IA_inv0rgba(31 downto 0) );
					v0.g <= f32(IA_inv0rgba(63 downto 32) );
					v0.b <= f32(IA_inv0rgba(95 downto 64) );
					v0.a <= f32(IA_inv0rgba(127 downto 96) );
					v0.tx <= f32(IA_inv0tx);
					v0.ty <= f32(IA_inv0ty);
					v0ClipOutcodes <= IA_inv0ClipOutcodes;

					v1.x <= f32(IA_inv1x);
					v1.y <= f32(IA_inv1y);
					v1.z <= f32(IA_inv1z);
					v1.w <= f32(IA_inv1w);
					v1.r <= f32(IA_inv1rgba(31 downto 0) );
					v1.g <= f32(IA_inv1rgba(63 downto 32) );
					v1.b <= f32(IA_inv1rgba(95 downto 64) );
					v1.a <= f32(IA_inv1rgba(127 downto 96) );
					v1.tx <= f32(IA_inv1tx);
					v1.ty <= f32(IA_inv1ty);
					v1ClipOutcodes <= IA_inv1ClipOutcodes;

					v2.x <= f32(IA_inv2x);
					v2.y <= f32(IA_inv2y);
					v2.z <= f32(IA_inv2z);
					v2.w <= f32(IA_inv2w);
					v2.r <= f32(IA_inv2rgba(31 downto 0) );
					v2.g <= f32(IA_inv2rgba(63 downto 32) );
					v2.b <= f32(IA_inv2rgba(95 downto 64) );
					v2.a <= f32(IA_inv2rgba(127 downto 96) );
					v2.tx <= f32(IA_inv2tx);
					v2.ty <= f32(IA_inv2ty);
					v2ClipOutcodes <= IA_inv2ClipOutcodes;

					prevStageReady <= '1';
					if (IA_inPreviousStageIsValid = '1' and prevStageReady = '1') then

						if (currentDrawEventID /= unsigned(IA_CurrentDrawEventID) ) then
							newDrawEventIDClear := '1';
							hasSentCurrentDrawEventID <= '0';
						else
							newDrawEventIDClear := '0';
						end if;
						currentDrawEventID <= unsigned(IA_CurrentDrawEventID);

						if (STATE_StateIsValid = '1' and STATE_NextDrawID = IA_CurrentDrawEventID) then
							STATE_ConsumeStateSlot <= '1';
							currentStateBlock <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID);
							currentState <= clip_setNewClipState; -- It's fine if this gets overridden by a later write to currentState. The important thing is that we don't just go back to this same state again on the next cycle,
							-- since that would clobber the state FIFO with a double-read!
						end if;

						stats_TrianglesInputToClipCullUnit <= stats_TrianglesInputToClipCullUnit + 1;

						if (ShouldDiscardTriangleCulled(IA_inv0ClipOutcodes, IA_inv1ClipOutcodes, IA_inv2ClipOutcodes) or ShouldDiscardTriangleInfNaNCulled(f32(IA_inv0x), f32(IA_inv0y), f32(IA_inv0z), f32(IA_inv0w), f32(IA_inv1x), f32(IA_inv1y), f32(IA_inv1z), f32(IA_inv1w), f32(IA_inv2x), f32(IA_inv2y), f32(IA_inv2z), f32(IA_inv2w) ) ) then
							if (hasSentCurrentDrawEventID = '1' and newDrawEventIDClear = '0') then
								prevStageReady <= '1';
							else
								currentState <= clip_sendNewDrawEventID;
							end if;
						elsif (DoesTriangleNeedClipping(IA_inv0ClipOutcodes, IA_inv1ClipOutcodes, IA_inv2ClipOutcodes, IA_inWholeTriangleAABBIntersectsViewport) ) then							
							if (currentStateBlock.ClippingEnable = '0') then
								if (hasSentCurrentDrawEventID = '1' and newDrawEventIDClear = '0') then
									prevStageReady <= '1';
								else
									currentState <= clip_sendNewDrawEventID;
								end if;
							else
								prevStageReady <= '0';
								currentState <= clip_computeClipMask;
							end if;
						else
							prevStageReady <= '0';

							stats_TrianglesPassedNoClipping <= stats_TrianglesPassedNoClipping + 1;

							currentState <= clip_sendToNextStage;
						end if;
					else
						if (IA_inPreviousStageIsValid = '0' and prevStageReady = '1') then
							CMD_IsIdle <= '1';
						end if;
					end if;

				when clip_computeClipMask =>
					clipSplitState <= GetOutcodeBitmapForPlane(v0ClipOutcodes, v1ClipOutcodes, v2ClipOutcodes, currentClipPlane);

					case currentClipPlane is
						when ClipPlaneZNear =>
							stats_ClipsAgainstZNearPlane <= stats_ClipsAgainstZNearPlane + 1;
						when ClipPlaneZFar =>
							stats_ClipsAgainstZFarPlane <= stats_ClipsAgainstZFarPlane + 1;
						when ClipPlaneRightGB =>
							stats_ClipsAgainstGBRightPlane <= stats_ClipsAgainstGBRightPlane + 1;
						when ClipPlaneLeftGB =>
							stats_ClipsAgainstGBLeftPlane <= stats_ClipsAgainstGBLeftPlane + 1;
						when ClipPlaneTopGB =>
							stats_ClipsAgainstGBTopPlane <= stats_ClipsAgainstGBTopPlane + 1;
						when ClipPlaneBottomGB =>
							stats_ClipsAgainstGBBottomPlane <= stats_ClipsAgainstGBBottomPlane + 1;
						when others =>
					end case;

					currentState <= clip_computeClipDistance0;

					case GetOutcodeBitmapForPlane(v0ClipOutcodes, v1ClipOutcodes, v2ClipOutcodes, currentClipPlane) is
						when "001" => -- 001 = A is outside, BC are inside
							outsideVert0 <= v0;
							outsideVert1 <= v0;
							insideVert0 <= v1;
							insideVert1 <= v2;
						when "010" => -- 010 = B is outside, AC are inside
							outsideVert0 <= v1;
							outsideVert1 <= v1;
							insideVert0 <= v0;
							insideVert1 <= v2;
						when "100" => -- 100 = C is outside, AB are inside
							outsideVert0 <= v2;
							outsideVert1 <= v2;
							insideVert0 <= v0;
							insideVert1 <= v1;
						when "110" => -- 110 = BC are outside, A is inside
							outsideVert0 <= v1;
							outsideVert1 <= v2;
							insideVert0 <= v0;
							insideVert1 <= v0;
						when "101" => -- 101 = AC are outside, B is inside
							outsideVert0 <= v0;
							outsideVert1 <= v2;
							insideVert0 <= v1;
							insideVert1 <= v1;
						when "011" => -- 011 = AB are outside, C is inside
							outsideVert0 <= v0;
							outsideVert1 <= v1;
							insideVert0 <= v2;
							insideVert1 <= v2;
						when others =>
							-- We should never be here!
					end case;

					currentTriAlreadyClippedPlanes(ClipPlaneEnum'pos(currentClipPlane) ) <= '1';

				when clip_computeClipDistance0 =>
					case currentClipPlane is
						when ClipPlaneZNear =>
							-- NumeratorA = insideVertex.z + 0.0f
							FPU_Add0_A <= std_logic_vector(insideVert0.z);
							FPU_Add0_B <= X"00000000";
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.z + 0.0f
							FPU_Add1_A <= std_logic_vector(outsideVert0.z);
							FPU_Add1_B <= X"00000000";
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneZFar =>
							-- NumeratorA = insideVertex.w - insideVertex.z
							FPU_Add0_A <= std_logic_vector(insideVert0.w);
							FPU_Add0_B <= std_logic_vector(FloatNegate(insideVert0.z) );
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w - outsideVertex.z
							FPU_Add1_A <= std_logic_vector(outsideVert0.w);
							FPU_Add1_B <= std_logic_vector(FloatNegate(outsideVert0.z) );
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneRightGB =>
							-- NumeratorA = insideVertex.w * 16 - insideVertex.x
							FPU_Add0_A <= std_logic_vector(FloatShiftX16(insideVert0.w) );
							FPU_Add0_B <= std_logic_vector(FloatNegate(insideVert0.x) );
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w * 16 - outsideVertex.x
							FPU_Add1_A <= std_logic_vector(FloatShiftX16(outsideVert0.w) );
							FPU_Add1_B <= std_logic_vector(FloatNegate(outsideVert0.x) );
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneLeftGB =>
							-- NumeratorA = insideVertex.w * 16 + insideVertex.x
							FPU_Add0_A <= std_logic_vector(FloatShiftX16(insideVert0.w) );
							FPU_Add0_B <= std_logic_vector(insideVert0.x);
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w * 16 + outsideVertex.x
							FPU_Add1_A <= std_logic_vector(FloatShiftX16(outsideVert0.w) );
							FPU_Add1_B <= std_logic_vector(outsideVert0.x);
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneTopGB =>
							-- NumeratorA = insideVertex.w * 32 - insideVertex.y
							FPU_Add0_A <= std_logic_vector(FloatShiftX32(insideVert0.w) );
							FPU_Add0_B <= std_logic_vector(FloatNegate(insideVert0.y) );
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w * 32 - outsideVertex.y
							FPU_Add1_A <= std_logic_vector(FloatShiftX32(outsideVert0.w) );
							FPU_Add1_B <= std_logic_vector(FloatNegate(outsideVert0.y) );
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneBottomGB =>
							-- NumeratorA = insideVertex.w * 32 + insideVertex.y
							FPU_Add0_A <= std_logic_vector(FloatShiftX32(insideVert0.w) );
							FPU_Add0_B <= std_logic_vector(insideVert0.y);
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w * 32 + outsideVertex.y
							FPU_Add1_A <= std_logic_vector(FloatShiftX32(outsideVert0.w) );
							FPU_Add1_B <= std_logic_vector(outsideVert0.y);
							FPU_Add1_IADD_GO <= '1';

						when others =>
					end case;
					currentState <= clip_computeClipDistance1;

				when clip_computeClipDistance1 =>
					case currentClipPlane is
						when ClipPlaneZNear =>
							-- NumeratorA = insideVertex.z + 0.0f
							FPU_Add0_A <= std_logic_vector(insideVert1.z);
							FPU_Add0_B <= X"00000000";
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.z + 0.0f
							FPU_Add1_A <= std_logic_vector(outsideVert1.z);
							FPU_Add1_B <= X"00000000";
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneZFar =>
							-- NumeratorA = insideVertex.w - insideVertex.z
							FPU_Add0_A <= std_logic_vector(insideVert1.w);
							FPU_Add0_B <= std_logic_vector(FloatNegate(insideVert1.z) );
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w - outsideVertex.z
							FPU_Add1_A <= std_logic_vector(outsideVert1.w);
							FPU_Add1_B <= std_logic_vector(FloatNegate(outsideVert1.z) );
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneRightGB =>
							-- NumeratorA = insideVertex.w * 16 - insideVertex.x
							FPU_Add0_A <= std_logic_vector(FloatShiftX16(insideVert1.w) );
							FPU_Add0_B <= std_logic_vector(FloatNegate(insideVert1.x) );
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w * 16 - outsideVertex.x
							FPU_Add1_A <= std_logic_vector(FloatShiftX16(outsideVert1.w) );
							FPU_Add1_B <= std_logic_vector(FloatNegate(outsideVert1.x) );
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneLeftGB =>
							-- NumeratorA = insideVertex.w * 16 + insideVertex.x
							FPU_Add0_A <= std_logic_vector(FloatShiftX16(insideVert1.w) );
							FPU_Add0_B <= std_logic_vector(insideVert1.x);
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w * 16 + outsideVertex.x
							FPU_Add1_A <= std_logic_vector(FloatShiftX16(outsideVert1.w) );
							FPU_Add1_B <= std_logic_vector(outsideVert1.x);
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneTopGB =>
							-- NumeratorA = insideVertex.w * 32 - insideVertex.y
							FPU_Add0_A <= std_logic_vector(FloatShiftX32(insideVert1.w) );
							FPU_Add0_B <= std_logic_vector(FloatNegate(insideVert1.y) );
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w * 32 - outsideVertex.y
							FPU_Add1_A <= std_logic_vector(FloatShiftX32(outsideVert1.w) );
							FPU_Add1_B <= std_logic_vector(FloatNegate(outsideVert1.y) );
							FPU_Add1_IADD_GO <= '1';

						when ClipPlaneBottomGB =>
							-- NumeratorA = insideVertex.w * 32 + insideVertex.y
							FPU_Add0_A <= std_logic_vector(FloatShiftX32(insideVert1.w) );
							FPU_Add0_B <= std_logic_vector(insideVert1.y);
							FPU_Add0_IADD_GO <= '1';

							-- NumeratorB = outsideVertex.w * 32 + outsideVertex.y
							FPU_Add1_A <= std_logic_vector(FloatShiftX32(outsideVert1.w) );
							FPU_Add1_B <= std_logic_vector(outsideVert1.y);
							FPU_Add1_IADD_GO <= '1';

						when others =>
					end case;
					currentState <= clip_computeClipDistance2;

				when clip_computeClipDistance2 =>
					FPU_Add0_IADD_GO <= '0';
					FPU_Add1_IADD_GO <= '0';
					currentState <= clip_computeClipDistance3;

				when clip_computeClipDistance3 =>
					currentState <= clip_computeClipDistance4;

				when clip_computeClipDistance4 =>
					currentState <= clip_computeClipDistance5;

				when clip_computeClipDistance5 =>
					-- (insideWAxis - outsideWAxis)
					FPU_Add0_A <= FPU_Add0_OUT;
					insideWAxis0 <= f32(FPU_Add0_OUT);
					FPU_Add0_B <= std_logic_vector(FloatNegate(f32(FPU_Add1_OUT) ) );
					FPU_Add0_IADD_GO <= '1';
					currentState <= clip_computeClipDistance6;

				when clip_computeClipDistance6 =>
					-- (insideWAxis - outsideWAxis)
					FPU_Add0_A <= FPU_Add0_OUT;
					insideWAxis1 <= f32(FPU_Add0_OUT);
					FPU_Add0_B <= std_logic_vector(FloatNegate(f32(FPU_Add1_OUT) ) );
					FPU_Add0_IADD_GO <= '1';
					currentState <= clip_computeClipDistance7;

				when clip_computeClipDistance7 =>
					FPU_Add0_IADD_GO <= '0';
					currentState <= clip_computeClipDistance8;

				when clip_computeClipDistance8 =>
					currentState <= clip_computeClipDistance9;

				when clip_computeClipDistance9 =>
					currentState <= clip_computeClipDistance10;

				when clip_computeClipDistance10 =>
					-- 1.0f / (insideWAxis - outsideWAxis)
					FPU_Rcp0_A <= FPU_Add0_OUT;
					FPU_Rcp0_ISPEC_GO <= '1';
					currentState <= clip_computeClipDistance11;

				when clip_computeClipDistance11 =>
					-- 1.0f / (insideWAxis - outsideWAxis)
					FPU_Rcp0_A <= FPU_Add0_OUT;
					FPU_Rcp0_ISPEC_GO <= '1';
					currentState <= clip_computeClipDistance12;

				when clip_computeClipDistance12 =>
					FPU_Rcp0_ISPEC_GO <= '0';
					currentState <= clip_computeClipDistance13;

				when clip_computeClipDistance13 =>
					currentState <= clip_computeClipDistance14;

				when clip_computeClipDistance14 =>
					currentState <= clip_computeClipDistance15;

				when clip_computeClipDistance15 =>
					currentState <= clip_computeClipDistance16;

				when clip_computeClipDistance16 =>
					currentState <= clip_computeClipDistance17;

				when clip_computeClipDistance17 =>
					currentState <= clip_computeClipDistance18;

				when clip_computeClipDistance18 =>
					currentState <= clip_computeClipDistance19;

				when clip_computeClipDistance19 =>
					currentState <= clip_computeClipDistance20;

				when clip_computeClipDistance20 =>
					currentState <= clip_computeClipDistance21;

				when clip_computeClipDistance21 =>
					currentState <= clip_computeClipDistance22;

				when clip_computeClipDistance22 =>
					currentState <= clip_computeClipDistance23;

				when clip_computeClipDistance23 =>
					currentState <= clip_computeClipDistance24;

				when clip_computeClipDistance24 =>
					currentState <= clip_computeClipDistance25;

				when clip_computeClipDistance25 =>
					-- intersectionPoint = insideWAxis / (insideWAxis - outsideWAxis);
					FPU_Mul0_A <= std_logic_vector(insideWAxis0);
					FPU_Mul0_B <= FPU_Rcp0_OUT;
					FPU_Mul0_IMUL_GO <= '1';
					currentState <= clip_computeClipDistance26;

				when clip_computeClipDistance26 =>
					-- intersectionPoint = insideWAxis / (insideWAxis - outsideWAxis);
					FPU_Mul0_A <= std_logic_vector(insideWAxis1);
					FPU_Mul0_B <= FPU_Rcp0_OUT;
					FPU_Mul0_IMUL_GO <= '1';
					currentState <= clip_computeClipDistance27;

				when clip_computeClipDistance27 =>
					FPU_Mul0_IMUL_GO <= '0';
					currentState <= clip_computeClipDistance28;

				when clip_computeClipDistance28 =>
					currentState <= clip_computeClipDistance29;

				when clip_computeClipDistance29 =>
					currentState <= clip_computeClipDistance30;

				when clip_computeClipDistance30 =>
					currentState <= clip_computeClipDistance31;

				when clip_computeClipDistance31 =>
					clipDistance0 <= f32(FPU_Mul0_OUT);

					-- invClipDistance = 1.0f - clipDistance
					FPU_Add0_A <= X"3F800000"; -- 1.0f
					FPU_Add0_B <= std_logic_vector(FloatNegate(f32(FPU_Mul0_OUT) ) );
					FPU_Add0_IADD_GO <= '1';

					currentState <= clip_computeClipDistance32;

				when clip_computeClipDistance32 =>
					clipDistance1 <= f32(FPU_Mul0_OUT);

					-- invClipDistance = 1.0f - clipDistance
					FPU_Add0_A <= X"3F800000"; -- 1.0f
					FPU_Add0_B <= std_logic_vector(FloatNegate(f32(FPU_Mul0_OUT) ) );
					FPU_Add0_IADD_GO <= '1';

					currentState <= clip_computeClipDistance33;

				when clip_computeClipDistance33 =>
					FPU_Add0_IADD_GO <= '0';
					currentState <= clip_computeClipDistance34;

				when clip_computeClipDistance34 =>
					currentState <= clip_computeClipDistance35;

				when clip_computeClipDistance35 =>
					currentState <= clip_computeClipDistance36;

				when clip_computeClipDistance36 =>
					clipDistanceInv0 <= f32(FPU_Add0_OUT);
					currentState <= clip_computeClipDistance37;

				when clip_computeClipDistance37 =>
					clipDistanceInv1 <= f32(FPU_Add0_OUT);
					currentState <= clip_clipVertInPlace0;

				when clip_clipVertInPlace0 =>
					-- invLerpAlpha * insideAttr.x
					FPU_Mul0_A <= std_logic_vector(insideVert0.x);
					FPU_Mul0_B <= std_logic_vector(clipDistanceInv0);
					FPU_Mul0_IMUL_GO <= '1';

					-- lerpAlpha * outsideAttr.x
					FPU_Mul1_A <= std_logic_vector(outsideVert0.x);
					FPU_Mul1_B <= std_logic_vector(clipDistance0);
					FPU_Mul1_IMUL_GO <= '1';
					currentState <= clip_clipVertInPlace1;

				when clip_clipVertInPlace1 =>
					-- invLerpAlpha * insideAttr.y
					FPU_Mul0_A <= std_logic_vector(insideVert0.y);

					-- lerpAlpha * outsideAttr.y
					FPU_Mul1_A <= std_logic_vector(outsideVert0.y);
					currentState <= clip_clipVertInPlace2;

				when clip_clipVertInPlace2 =>
					-- invLerpAlpha * insideAttr.z
					FPU_Mul0_A <= std_logic_vector(insideVert0.z);

					-- lerpAlpha * outsideAttr.z
					FPU_Mul1_A <= std_logic_vector(outsideVert0.z);
					currentState <= clip_clipVertInPlace3;

				when clip_clipVertInPlace3 =>
					-- invLerpAlpha * insideAttr.w
					FPU_Mul0_A <= std_logic_vector(insideVert0.w);

					-- lerpAlpha * outsideAttr.w
					FPU_Mul1_A <= std_logic_vector(outsideVert0.w);
					currentState <= clip_clipVertInPlace4;

				when clip_clipVertInPlace4 =>
					-- invLerpAlpha * insideAttr.r
					FPU_Mul0_A <= std_logic_vector(insideVert0.r);

					-- lerpAlpha * outsideAttr.r
					FPU_Mul1_A <= std_logic_vector(outsideVert0.r);
					currentState <= clip_clipVertInPlace5;

				when clip_clipVertInPlace5 =>
					-- invLerpAlpha * insideAttr.g
					FPU_Mul0_A <= std_logic_vector(insideVert0.g);

					-- lerpAlpha * outsideAttr.g
					FPU_Mul1_A <= std_logic_vector(outsideVert0.g);
					currentState <= clip_clipVertInPlace6;

				when clip_clipVertInPlace6 =>
					-- invLerpAlpha * insideAttr.b
					FPU_Mul0_A <= std_logic_vector(insideVert0.b);

					-- lerpAlpha * outsideAttr.b
					FPU_Mul1_A <= std_logic_vector(outsideVert0.b);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;
					FPU_Add0_IADD_GO <= '1';

					currentState <= clip_clipVertInPlace7;

				when clip_clipVertInPlace7 =>
					-- invLerpAlpha * insideAttr.a
					FPU_Mul0_A <= std_logic_vector(insideVert0.a);

					-- lerpAlpha * outsideAttr.a
					FPU_Mul1_A <= std_logic_vector(outsideVert0.a);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					currentState <= clip_clipVertInPlace8;

				when clip_clipVertInPlace8 =>
					-- invLerpAlpha * insideAttr.tx
					FPU_Mul0_A <= std_logic_vector(insideVert0.tx);

					-- lerpAlpha * outsideAttr.tx
					FPU_Mul1_A <= std_logic_vector(outsideVert0.tx);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					currentState <= clip_clipVertInPlace9;

				when clip_clipVertInPlace9 =>
					-- invLerpAlpha * insideAttr.ty
					FPU_Mul0_A <= std_logic_vector(insideVert0.ty);

					-- lerpAlpha * outsideAttr.ty
					FPU_Mul1_A <= std_logic_vector(outsideVert0.ty);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					currentState <= clip_clipVertInPlace10;

				when clip_clipVertInPlace10 =>
					-- invLerpAlpha * insideAttr.x
					FPU_Mul0_A <= std_logic_vector(insideVert1.x);
					FPU_Mul0_B <= std_logic_vector(clipDistanceInv1);

					-- lerpAlpha * outsideAttr.x
					FPU_Mul1_A <= std_logic_vector(outsideVert1.x);
					FPU_Mul1_B <= std_logic_vector(clipDistance1);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					currentState <= clip_clipVertInPlace11;

				when clip_clipVertInPlace11 =>
					-- invLerpAlpha * insideAttr.y
					FPU_Mul0_A <= std_logic_vector(insideVert1.y);

					-- lerpAlpha * outsideAttr.y
					FPU_Mul1_A <= std_logic_vector(outsideVert1.y);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.x <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace12;

				when clip_clipVertInPlace12 =>
					-- invLerpAlpha * insideAttr.z
					FPU_Mul0_A <= std_logic_vector(insideVert1.z);

					-- lerpAlpha * outsideAttr.z
					FPU_Mul1_A <= std_logic_vector(outsideVert1.z);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.y <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace13;

				when clip_clipVertInPlace13 =>
					-- invLerpAlpha * insideAttr.w
					FPU_Mul0_A <= std_logic_vector(insideVert1.w);

					-- lerpAlpha * outsideAttr.w
					FPU_Mul1_A <= std_logic_vector(outsideVert1.w);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.z <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace14;

				when clip_clipVertInPlace14 =>
					-- invLerpAlpha * insideAttr.r
					FPU_Mul0_A <= std_logic_vector(insideVert1.r);

					-- lerpAlpha * outsideAttr.r
					FPU_Mul1_A <= std_logic_vector(outsideVert1.r);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.w <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace15;

				when clip_clipVertInPlace15 =>
					-- invLerpAlpha * insideAttr.g
					FPU_Mul0_A <= std_logic_vector(insideVert1.g);

					-- lerpAlpha * outsideAttr.g
					FPU_Mul1_A <= std_logic_vector(outsideVert1.g);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.r <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace16;

				when clip_clipVertInPlace16 =>
					-- invLerpAlpha * insideAttr.b
					FPU_Mul0_A <= std_logic_vector(insideVert1.b);

					-- lerpAlpha * outsideAttr.b
					FPU_Mul1_A <= std_logic_vector(outsideVert1.b);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.g <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace17;

				when clip_clipVertInPlace17 =>
					-- invLerpAlpha * insideAttr.a
					FPU_Mul0_A <= std_logic_vector(insideVert1.a);

					-- lerpAlpha * outsideAttr.a
					FPU_Mul1_A <= std_logic_vector(outsideVert1.a);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.b <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace18;

				when clip_clipVertInPlace18 =>
					-- invLerpAlpha * insideAttr.tx
					FPU_Mul0_A <= std_logic_vector(insideVert1.tx);

					-- lerpAlpha * outsideAttr.tx
					FPU_Mul1_A <= std_logic_vector(outsideVert1.tx);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.a <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace19;

				when clip_clipVertInPlace19 =>
					-- invLerpAlpha * insideAttr.ty
					FPU_Mul0_A <= std_logic_vector(insideVert1.ty);

					-- lerpAlpha * outsideAttr.ty
					FPU_Mul1_A <= std_logic_vector(outsideVert1.ty);

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.tx <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace20;

				when clip_clipVertInPlace20 =>
					FPU_Mul0_IMUL_GO <= '0';
					FPU_Mul1_IMUL_GO <= '0';

					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert0.ty <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace21;

				when clip_clipVertInPlace21 =>
					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert1.x <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace22;

				when clip_clipVertInPlace22 =>
					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert1.y <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace23;

				when clip_clipVertInPlace23 =>
					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert1.z <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace24;

				when clip_clipVertInPlace24 =>
					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert1.w <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace25;

				when clip_clipVertInPlace25 =>
					-- (invLerpAlpha * insideAttr) + (lerpAlpha * outsideAttr)
					FPU_Add0_A <= FPU_Mul0_OUT;
					FPU_Add0_B <= FPU_Mul1_OUT;

					outsideVert1.r <= f32(FPU_Add0_OUT);

					currentState <= clip_clipVertInPlace26;

				when clip_clipVertInPlace26 =>
					FPU_Add0_IADD_GO <= '0';

					outsideVert1.g <= f32(FPU_Add0_OUT);
					currentState <= clip_clipVertInPlace27;

				when clip_clipVertInPlace27 =>
					outsideVert1.b <= f32(FPU_Add0_OUT);
					currentState <= clip_clipVertInPlace28;

				when clip_clipVertInPlace28 =>
					outsideVert1.a <= f32(FPU_Add0_OUT);
					currentState <= clip_clipVertInPlace29;

				when clip_clipVertInPlace29 =>
					outsideVert1.tx <= f32(FPU_Add0_OUT);
					currentState <= clip_clipVertInPlace30;

				when clip_clipVertInPlace30 =>
					outsideVert1.ty <= f32(FPU_Add0_OUT);

					outsideVert0.x <= ClampXToClippedPlanes(currentTriAlreadyClippedPlanes, outsideVert0.x, outsideVert0.w);
					outsideVert0.y <= ClampYToClippedPlanes(currentTriAlreadyClippedPlanes, outsideVert0.y, outsideVert0.w);
					outsideVert0.z <= ClampZToClippedPlanes(currentTriAlreadyClippedPlanes, outsideVert0.z, outsideVert0.w);
					outsideVert0.w <= ClampW(outsideVert0.w);
					outsideVert1.x <= ClampXToClippedPlanes(currentTriAlreadyClippedPlanes, outsideVert1.x, outsideVert1.w);
					outsideVert1.y <= ClampYToClippedPlanes(currentTriAlreadyClippedPlanes, outsideVert1.y, outsideVert1.w);
					outsideVert1.z <= ClampZToClippedPlanes(currentTriAlreadyClippedPlanes, outsideVert1.z, outsideVert1.w);
					outsideVert1.w <= ClampW(outsideVert1.w);

					currentState <= clip_reconstructTriangles;

				when clip_reconstructTriangles =>
					case clipSplitState is
						when "001" | "010" | "100" =>
							stats_ChildTrianglesGeneratedFromClipping <= stats_ChildTrianglesGeneratedFromClipping + 1;
							PushTriangleStack(storedTriData, triDataStackSize);

						when others =>
							-- Do nothing
					end case;

					case clipSplitState is
						when "001" =>
							storedTriData(0).tri_v0 <= outsideVert1;
							storedTriData(0).tri_v1 <= outsideVert0;
							storedTriData(0).tri_v2 <= v2;
							storedTriData(0).childAlreadyClippedPlanes <= currentTriAlreadyClippedPlanes;
						when "010" =>
							storedTriData(0).tri_v0 <= v0;
							storedTriData(0).tri_v1 <= outsideVert0;
							storedTriData(0).tri_v2 <= outsideVert1;
							storedTriData(0).childAlreadyClippedPlanes <= currentTriAlreadyClippedPlanes;
						when "100" =>
							storedTriData(0).tri_v0 <= outsideVert0;
							storedTriData(0).tri_v1 <= v1;
							storedTriData(0).tri_v2 <= outsideVert1;
							storedTriData(0).childAlreadyClippedPlanes <= currentTriAlreadyClippedPlanes;
						when others =>
							-- Do nothing
					end case;

					case clipSplitState is
						when "001" =>
							v0 <= outsideVert0;
						when "010" =>
							v1 <= outsideVert1;
						when "100" =>
							v2 <= outsideVert0;
						when "011" =>
							v0 <= outsideVert0;
							v1 <= outsideVert1;
						when "101" =>
							v0 <= outsideVert0;
							v2 <= outsideVert1;
						when "110" =>
							v1 <= outsideVert0;
							v2 <= outsideVert1;
						when others =>
							-- Do nothing, should never be here
					end case;
					currentState <= clip_recomputeClipOutcodes;

				when clip_recomputeClipOutcodes =>
					v0ClipOutcodes <= ComputeClipOutCodes(v0.x, v0.y, v0.z, v0.w);
					v1ClipOutcodes <= ComputeClipOutCodes(v1.x, v1.y, v1.z, v1.w);
					v2ClipOutcodes <= ComputeClipOutCodes(v2.x, v2.y, v2.z, v2.w);
					currentState <= clip_finishOrNextPlane;

				when clip_finishOrNextPlane =>
					currentClipPlane <= GetNextPlaneNeedsClipping(v0ClipOutcodes, v1ClipOutcodes, v2ClipOutcodes, triAABBIntersectsViewport);
					if (ShouldDiscardTriangleCulled(v0ClipOutcodes, v1ClipOutcodes, v2ClipOutcodes) ) then
						if (triDataStackSize = 0) then
							if (hasSentCurrentDrawEventID = '1') then
								prevStageReady <= '1';
								currentState <= idleState;
							else
								currentState <= clip_sendNewDrawEventID;
							end if;
						else
							prevStageReady <= '0';
							currentState <= clip_popNextChildTriangle0;
						end if;
					elsif (GetNextPlaneNeedsClipping(v0ClipOutcodes, v1ClipOutcodes, v2ClipOutcodes, triAABBIntersectsViewport) = ClipDone) then
						currentState <= clip_sendToNextStage;
					else
						currentState <= clip_computeClipMask;
					end if;

				when clip_sendToNextStage =>
					nextStageValid <= '1';

					TRISETUP_outv0x <= std_logic_vector(v0.x);
					TRISETUP_outv0y <= std_logic_vector(v0.y);
					TRISETUP_outv0z <= std_logic_vector(v0.z);
					TRISETUP_outv0w <= std_logic_vector(v0.w);
					TRISETUP_outv0rgba <= std_logic_vector(v0.a & v0.b & v0.g & v0.r);
					TRISETUP_outv0tx <= std_logic_vector(v0.tx);
					TRISETUP_outv0ty <= std_logic_vector(v0.ty);

					TRISETUP_outv1x <= std_logic_vector(v1.x);
					TRISETUP_outv1y <= std_logic_vector(v1.y);
					TRISETUP_outv1z <= std_logic_vector(v1.z);
					TRISETUP_outv1w <= std_logic_vector(v1.w);
					TRISETUP_outv1rgba <= std_logic_vector(v1.a & v1.b & v1.g & v1.r);
					TRISETUP_outv1tx <= std_logic_vector(v1.tx);
					TRISETUP_outv1ty <= std_logic_vector(v1.ty);

					TRISETUP_outv2x <= std_logic_vector(v2.x);
					TRISETUP_outv2y <= std_logic_vector(v2.y);
					TRISETUP_outv2z <= std_logic_vector(v2.z);
					TRISETUP_outv2w <= std_logic_vector(v2.w);
					TRISETUP_outv2rgba <= std_logic_vector(v2.a & v2.b & v2.g & v2.r);
					TRISETUP_outv2tx <= std_logic_vector(v2.tx);
					TRISETUP_outv2ty <= std_logic_vector(v2.ty);

					TRISETUP_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
					hasSentCurrentDrawEventID <= '1';

					if (nextStageValid = '1' and TRISETUP_inNextStageisReady = '1') then
						nextStageValid <= '0';

						stats_TrianglesOutputFromClipCullUnit <= stats_TrianglesOutputFromClipCullUnit + 1;

						if (triDataStackSize = 0) then
							prevStageReady <= '1';
							currentState <= idleState;
						else
							prevStageReady <= '0';
							currentState <= clip_popNextChildTriangle0;
						end if;
					end if;

				when clip_popNextChildTriangle0 =>
					v0 <= storedTriData(0).tri_v0;
					v1 <= storedTriData(0).tri_v1;
					v2 <= storedTriData(0).tri_v2;
					currentTriAlreadyClippedPlanes <= storedTriData(0).childAlreadyClippedPlanes;

					v0ClipOutcodes <= ComputeClipOutCodes(storedTriData(0).tri_v0.x, storedTriData(0).tri_v0.y, storedTriData(0).tri_v0.z, storedTriData(0).tri_v0.w);
					v1ClipOutcodes <= ComputeClipOutCodes(storedTriData(0).tri_v1.x, storedTriData(0).tri_v1.y, storedTriData(0).tri_v1.z, storedTriData(0).tri_v1.w);
					v2ClipOutcodes <= ComputeClipOutCodes(storedTriData(0).tri_v2.x, storedTriData(0).tri_v2.y, storedTriData(0).tri_v2.z, storedTriData(0).tri_v2.w);

					PopTriangleStack(storedTriData, triDataStackSize);

					currentState <= clip_popNextChildTriangle1;

				when clip_popNextChildTriangle1 =>
					if (ShouldDiscardTriangleCulled(v0ClipOutcodes, v1ClipOutcodes, v2ClipOutcodes) or ShouldDiscardTriangleInfNaNCulled(v0.x, v0.y, v0.z, v0.w, v1.x, v1.y, v1.z, v1.w, v2.x, v2.y, v2.z, v2.w) ) then
						if (triDataStackSize = 0) then
							if (hasSentCurrentDrawEventID = '1') then
								prevStageReady <= '1';
								currentState <= idleState;
							else
								currentState <= clip_sendNewDrawEventID;
							end if;
						else
							currentState <= clip_popNextChildTriangle0;
						end if;
					elsif (DoesTriangleNeedClipping(v0ClipOutcodes, v1ClipOutcodes, v2ClipOutcodes, triAABBIntersectsViewport) ) then							
						currentClipPlane <= GetNextPlaneNeedsClipping(v0ClipOutcodes, v1ClipOutcodes, v2ClipOutcodes, triAABBIntersectsViewport);
						currentState <= clip_computeClipMask;
					else
						currentState <= clip_sendToNextStage;
					end if;

				when clip_sendNewDrawEventID =>
					v0.x <= (others => '1'); -- NaN
					v0.w <= (others => '0'); -- Denormal zero reciprocal-W
					currentState <= clip_sendToNextStage;

				when clip_setNewClipState =>
					currentState <= idleState;

			end case;
		end if;
	end process;

	
end Behavioral;
