library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.PixelPipeline_Types.all;
use work.PacketType.all;
use work.AttrInterpolatorState.all;

entity AttrInterpolator is
	Port ( clk : in STD_LOGIC;

	-- Depth Interpolator FIFO interface begin
		DINTERP_FIFO_rd_data : in STD_LOGIC_VECTOR(INTERPOLATOR_DATA_BITS-1 downto 0);
        DINTERP_FIFO_empty : in STD_LOGIC;
        DINTERP_FIFO_rd_en : out STD_LOGIC := '0';
	-- Depth Interpolator FIFO interface end

	-- Triangle Cache interfaces begin
		TRICACHE_inT0X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT0Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT10X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT10Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT20X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT20Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inColorRGBA0 : in STD_LOGIC_VECTOR(127 downto 0);
		TRICACHE_inColorRGBA10 : in STD_LOGIC_VECTOR(127 downto 0);
		TRICACHE_inColorRGBA20 : in STD_LOGIC_VECTOR(127 downto 0);

		TRICACHE_PopTriangleSlot : out STD_LOGIC := '0';
	-- Triangle Cache interfaces end

	-- FPU interfaces begin
		-- MUL pipe for multiplication:
		FPU_MUL_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_MUL_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_MUL_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_MUL_GO : out STD_LOGIC := '0';

		-- CNV pipe for float-to-int conversions and frac():
		FPU_CNV_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_CNV_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_CNV_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_CNV_GO : out STD_LOGIC := '0';
	-- FPU interfaces end

	-- Texture Sampler FIFO interface begin
		TEXSAMP_OutFIFO_wr_data : out STD_LOGIC_VECTOR(95 downto 0) := (others => '0'); -- 12 bytes per pixel of output data to the texture sampler
        TEXSAMP_OutFIFO_full : in STD_LOGIC;
        TEXSAMP_OutFIFO_wr_en : out STD_LOGIC := '0';
	-- Texture Sampler FIFO interface end

	-- Attribute Interpolator State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(ATTR_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- Attribute Interpolator State Block interface end

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
		DBG_AttrInterpolator_State : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
		DBG_RastBarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end AttrInterpolator;

architecture Behavioral of AttrInterpolator is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_OutFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_OutFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_OutFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of DINTERP_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO EMPTY";

constant flatshading : STD_LOGIC := '0';

type attrInterpStateType is 
(
	waitingForRead, -- 0

	multBarycentricsAndAttr0, -- 1
	multBarycentricsAndAttr1, -- 2
	multBarycentricsAndAttr2, -- 3
	multBarycentricsAndAttr3, -- 4
	multBarycentricsAndAttr4, -- 5
	multBarycentricsAndAttr5, -- 6
	multBarycentricsAndAttr6, -- 7
	multBarycentricsAndAttr7, -- 8
	multBarycentricsAndAttr8, -- 9
	multBarycentricsAndAttr9, -- 10
	multBarycentricsAndAttr10, -- 11
	multBarycentricsAndAttr11, -- 12
	multBarycentricsAndAttr12, -- 13
	multBarycentricsAndAttr13, -- 14
	multBarycentricsAndAttr14, -- 15

	multiplyPixelW0, -- 16
	multiplyPixelW1, -- 17
	multiplyPixelW2, -- 18
	multiplyPixelW3, -- 19
	multiplyPixelW4, -- 20
	multiplyPixelW5, -- 21
	multiplyPixelW6, -- 22
	multiplyPixelW7, -- 23
	multiplyPixelW8, -- 24
	multiplyPixelW9, -- 25
	multiplyPixelW10, -- 26
	multiplyPixelW11, -- 27

	compressOutput0, -- 28
	compressOutput1, -- 29
	compressOutput2, -- 30
	compressOutput3, -- 31
	compressOutput4, -- 32
	compressOutput5, -- 33
	compressOutput6, -- 34
	compressOutput7, -- 35
	compressOutput8, -- 36
	compressOutput9, -- 37
	compressOutput10, -- 38
	compressOutput11, -- 39

	waitingForWrite, -- 40
	setNewPrimitive, -- 41
	terminateCurrentPrimitive -- 42
);

type VertexFloatData is record
	tx : f32;
	ty : f32;

	color_r : f32;
	color_g : f32;
	color_b : f32;
	color_a : f32;
end record VertexFloatData;

COMPONENT FloatALU_Interpolator
	Port (clk : in STD_LOGIC;

		IN_B : in STD_LOGIC_VECTOR(31 downto 0);
		IN_C : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr0 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr10 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr20 : in STD_LOGIC_VECTOR(31 downto 0);

		OINTERP : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- INTERP pipe operates in 5+4+4=13 clock cycles.
		IINTERP_GO : in STD_LOGIC
		);
end component;

constant DefaultVertexFloatData : VertexFloatData := (others => (others => '0') );

signal readyForNewPixel : std_logic := '0';

signal currentState : attrInterpStateType := waitingForRead;

signal storedPixelX : unsigned(15 downto 0) := (others => '0');
signal storedPixelY : unsigned(15 downto 0) := (others => '0');
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');

signal pixelW : f32 := (others => '0'); -- float32 format (0.0f to 1.0f) pixel W value
signal normalizedBarycentricB : f32 := (others => '0'); -- float32 format
signal normalizedBarycentricC : f32 := (others => '0'); -- float32 format
signal useFlatShading : std_logic := '0';
signal texcoord0AddressingModeU : eTexcoordAddressingMode := TAM_Wrap; -- Default to wrap mode.
signal texcoord0AddressingModeV : eTexcoordAddressingMode := TAM_Wrap; -- Default to wrap mode.

signal unpackedVertex0 : VertexFloatData := DefaultVertexFloatData;
signal unpackedVertex10 : VertexFloatData := DefaultVertexFloatData;
signal unpackedVertex20 : VertexFloatData := DefaultVertexFloatData;
signal computedPixelData : VertexFloatData := DefaultVertexFloatData;

signal dotProductTemporarySumTX : f32 := (others => '0');
signal dotProductTemporarySumTY : f32 := (others => '0');
signal dotProductTemporarySumColorR : f32 := (others => '0');
signal dotProductTemporarySumColorG : f32 := (others => '0');
signal dotProductTemporarySumColorB : f32 := (others => '0');
signal dotProductTemporarySumColorA : f32 := (others => '0');

signal wrappedTexcoordTX : f32 := (others => '0');
signal wrappedTexcoordTY : f32 := (others => '0');
signal compressedOutPixelDataTX : unsigned(15 downto 0) := (others => '0');
signal compressedOutPixelDataTY : unsigned(15 downto 0) := (others => '0');
signal compressedOutPixelDataColorR : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorG : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorB : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorA : unsigned(7 downto 0) := (others => '0');

signal interpInputB : f32 := (others => '0');
signal interpInputC : f32 := (others => '0');
signal interpInputAttr0 : f32 := (others => '0');
signal interpInputAttr10 : f32 := (others => '0');
signal interpInputAttr20 : f32 := (others => '0');
signal interpGoSignal : std_logic := '0';
signal interpOutput : std_logic_vector(31 downto 0) := (others => '0');

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

pure function SaturateFloat(inFloat : f32) return f32 is
begin
	if (inFloat(31) = '1') then
		return X"00000000";
	elsif (inFloat(30 downto 0) > "111111100000000000000000000000") then
		return X"3F800000";
	else
		return inFloat;
	end if;
end function;

pure function PackOutputData(pixelX : unsigned(15 downto 0); pixelY : unsigned(15 downto 0); texcoordX : unsigned(15 downto 0); texcoordY : unsigned(15 downto 0); colorR : unsigned(7 downto 0); colorG : unsigned(7 downto 0); colorB : unsigned(7 downto 0); colorA : unsigned(7 downto 0) ) return unsigned is
begin
	return colorA & colorB & colorG & colorR & texcoordY & texcoordX & pixelY & pixelX;
end function;

begin

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_AttrInterpolator_State <= std_logic_vector(to_unsigned(attrInterpStateType'pos(currentState), 7) );
DBG_RastBarycentricB <= std_logic_vector(interpInputAttr0);
DBG_RastBarycentricC <= std_logic_vector(interpInputAttr20);

Interpolator : FloatALU_Interpolator port map(clk => clk, IN_B => std_logic_vector(interpInputB), IN_C => std_logic_vector(interpInputC), IN_Attr0 => std_logic_vector(interpInputAttr0), IN_Attr10 => std_logic_vector(interpInputAttr10), IN_Attr20 => std_logic_vector(interpInputAttr20), OINTERP => interpOutput, IINTERP_GO => interpGoSignal);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
			case currentState is
				when waitingForRead =>
					statCyclesIdle <= statCyclesIdle + 1;

				when waitingForWrite =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			CMD_IsIdle <= '0';
			STATE_ConsumeStateSlot <= '0';
			DINTERP_FIFO_rd_en <= '0';
			FPU_MUL_GO <= '0';
			FPU_CNV_GO <= '0';
			TRICACHE_PopTriangleSlot <= '0';

			case currentState is
				when waitingForRead =>
					readyForNewPixel <= '0';

					storedPixelX <= DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX;
					storedPixelY <= DeserializeAttributeData(DINTERP_FIFO_rd_data).PosY;
					normalizedBarycentricB <= DeserializeAttributeData(DINTERP_FIFO_rd_data).NormalizedBarycentricB;
					normalizedBarycentricC <= DeserializeAttributeData(DINTERP_FIFO_rd_data).NormalizedBarycentricC;
					pixelW <= DeserializeAttributeData(DINTERP_FIFO_rd_data).InterpolatedPixelW;

					TEXSAMP_OutFIFO_wr_en <= '0'; -- Deassert after one clock cycle

					if (STATE_StateIsValid = '1' and currentDrawEventID = unsigned(STATE_NextDrawID) ) then
						STATE_ConsumeStateSlot <= '1';

						useFlatShading <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).UseFlatShadingColors;
						texcoord0AddressingModeU <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).Texcoord0AddressingModeU;
						texcoord0AddressingModeV <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).Texcoord0AddressingModeV;
					elsif (DINTERP_FIFO_empty = '0' and readyForNewPixel = '1') then
						readyForNewPixel <= '0';
						DINTERP_FIFO_rd_en <= '1';

						if (IsSpecialPixelMessage(DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX) ) then
							if (DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX(eSpecialPixelCodeBits'pos(SetNewDrawEventID) ) = '1') then
								currentDrawEventID <= unsigned(DeserializeAttributeData(DINTERP_FIFO_rd_data).PosY);
								currentState <= waitingForWrite;
							end if;
							if (DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX(eSpecialPixelCodeBits'pos(TerminateCurrentDrawEventID) ) = '1') then
								currentState <= waitingForWrite;
							end if;
							if (DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX(eSpecialPixelCodeBits'pos(SetNewPrimSlot) ) = '1') then
								currentState <= setNewPrimitive;
							end if;
							if (DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX(eSpecialPixelCodeBits'pos(TerminateCurrentPrimSlot) ) = '1') then
								TRICACHE_PopTriangleSlot <= '1';
								currentState <= terminateCurrentPrimitive;
							end if;
						else
							if (useFlatShading = '1') then -- If we're doing flat shading then we should skip all of this interpolation math
								currentState <= compressOutput0;
							else
								currentState <= multBarycentricsAndAttr0;
							end if;
						end if;
					else
						if (readyForNewPixel = '1') then
							CMD_IsIdle <= '1';
						end if;

						readyForNewPixel <= '1';
					end if;

				when multBarycentricsAndAttr0 =>

					interpInputB <= normalizedBarycentricB;
					interpInputC <= normalizedBarycentricC;
					interpInputAttr0 <= unpackedVertex0.tx;
					interpInputAttr10 <= unpackedVertex10.tx;
					interpInputAttr20 <= unpackedVertex20.tx;
					interpGoSignal <= '1';

					currentState <= multBarycentricsAndAttr1;

				when multBarycentricsAndAttr1 =>
					interpInputAttr0 <= unpackedVertex0.ty;
					interpInputAttr10 <= unpackedVertex10.ty;
					interpInputAttr20 <= unpackedVertex20.ty;
					interpGoSignal <= '1';

					currentState <= multBarycentricsAndAttr2;

				when multBarycentricsAndAttr2 =>
					interpInputAttr0 <= unpackedVertex0.color_r;
					interpInputAttr10 <= unpackedVertex10.color_r;
					interpInputAttr20 <= unpackedVertex20.color_r;
					interpGoSignal <= '1';

					currentState <= multBarycentricsAndAttr3;

				when multBarycentricsAndAttr3 =>
					interpInputAttr0 <= unpackedVertex0.color_g;
					interpInputAttr10 <= unpackedVertex10.color_g;
					interpInputAttr20 <= unpackedVertex20.color_g;
					interpGoSignal <= '1';

					currentState <= multBarycentricsAndAttr4;

				when multBarycentricsAndAttr4 =>
					interpInputAttr0 <= unpackedVertex0.color_b;
					interpInputAttr10 <= unpackedVertex10.color_b;
					interpInputAttr20 <= unpackedVertex20.color_b;
					interpGoSignal <= '1';

					currentState <= multBarycentricsAndAttr5;

				when multBarycentricsAndAttr5 =>
					interpInputAttr0 <= unpackedVertex0.color_a;
					interpInputAttr10 <= unpackedVertex10.color_a;
					interpInputAttr20 <= unpackedVertex20.color_a;
					interpGoSignal <= '1';

					currentState <= multBarycentricsAndAttr6;

				when multBarycentricsAndAttr6 =>
					interpGoSignal <= '0';
					currentState <= multBarycentricsAndAttr7;

				when multBarycentricsAndAttr7 =>
					currentState <= multBarycentricsAndAttr8;

				when multBarycentricsAndAttr8 =>
					currentState <= multBarycentricsAndAttr9;

				when multBarycentricsAndAttr9 =>
					currentState <= multBarycentricsAndAttr10;

				when multBarycentricsAndAttr10 =>
					currentState <= multBarycentricsAndAttr11;

				when multBarycentricsAndAttr11 =>
					currentState <= multBarycentricsAndAttr12;

				when multBarycentricsAndAttr12 =>
					currentState <= multBarycentricsAndAttr13;

				when multBarycentricsAndAttr13 =>
					currentState <= multiplyPixelW0;

				when multBarycentricsAndAttr14 =>
					currentState <= multiplyPixelW0;

				when multiplyPixelW0 =>
					FPU_MUL_A <= interpOutput;
					FPU_MUL_B <= std_logic_vector(pixelW);
					FPU_MUL_GO <= '1';
					currentState <= multiplyPixelW1;

				when multiplyPixelW1 =>
					FPU_MUL_A <= interpOutput;
					FPU_MUL_GO <= '1';
					currentState <= multiplyPixelW2;

				when multiplyPixelW2 =>
					FPU_MUL_A <= interpOutput;
					FPU_MUL_GO <= '1';
					currentState <= multiplyPixelW3;

				when multiplyPixelW3=>
					FPU_MUL_A <= interpOutput;
					FPU_MUL_GO <= '1';
					currentState <= multiplyPixelW4;

				when multiplyPixelW4 =>
					FPU_MUL_A <= interpOutput;
					FPU_MUL_GO <= '1';
					currentState <= multiplyPixelW5;

				when multiplyPixelW5 =>
					FPU_MUL_A <= interpOutput;
					FPU_MUL_GO <= '1';
					currentState <= multiplyPixelW6;

				when multiplyPixelW6 =>
					computedPixelData.tx <= f32(FPU_MUL_OUT);
					currentState <= multiplyPixelW7;

				when multiplyPixelW7 =>
					computedPixelData.ty <= f32(FPU_MUL_OUT);
					currentState <= multiplyPixelW8;

				when multiplyPixelW8 =>
					computedPixelData.color_r <= f32(FPU_MUL_OUT);
					currentState <= multiplyPixelW9;

				when multiplyPixelW9 =>
					computedPixelData.color_g <= f32(FPU_MUL_OUT);
					currentState <= multiplyPixelW10;

				when multiplyPixelW10 =>
					computedPixelData.color_b <= f32(FPU_MUL_OUT);
					currentState <= multiplyPixelW11;

				when multiplyPixelW11 =>
					computedPixelData.color_a <= f32(FPU_MUL_OUT);
					if (texcoord0AddressingModeU = TAM_Clamp) then
						wrappedTexcoordTX <= SaturateFloat(computedPixelData.tx);
					end if;

					if (texcoord0AddressingModeV = TAM_Clamp) then
						wrappedTexcoordTY <= SaturateFloat(computedPixelData.ty);
					end if;

					if (texcoord0AddressingModeU = TAM_Clamp and texcoord0AddressingModeV = TAM_Clamp) then
						currentState <= compressOutput2;
					else
						currentState <= compressOutput0;
					end if;

				when compressOutput0 =>
					FPU_CNV_A <= std_logic_vector(computedPixelData.tx);
					FPU_CNV_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_Frc), 3) );
					FPU_CNV_GO <= '1';
					currentState <= compressOutput1;

				when compressOutput1 =>
					FPU_CNV_A <= std_logic_vector(computedPixelData.ty);
					FPU_CNV_GO <= '1';
					currentState <= compressOutput2;

				when compressOutput2 =>
					FPU_CNV_A <= std_logic_vector(SaturateFloat(computedPixelData.color_r) );
					FPU_CNV_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_CNV_GO <= '1';
					currentState <= compressOutput3;

				when compressOutput3 =>
					FPU_CNV_A <= std_logic_vector(SaturateFloat(computedPixelData.color_g) );
					FPU_CNV_GO <= '1';
					currentState <= compressOutput4;

				when compressOutput4 =>
					if (texcoord0AddressingModeU = TAM_Wrap) then
						wrappedTexcoordTX <= f32(FPU_CNV_OUT);
					end if;
					FPU_CNV_A <= std_logic_vector(SaturateFloat(computedPixelData.color_b) );
					FPU_CNV_GO <= '1';
					currentState <= compressOutput5;

				when compressOutput5 =>
					if (texcoord0AddressingModeV = TAM_Wrap) then
						wrappedTexcoordTY <= f32(FPU_CNV_OUT);
					end if;
					FPU_CNV_A <= std_logic_vector(SaturateFloat(computedPixelData.color_a) );
					FPU_CNV_GO <= '1';
					currentState <= compressOutput6;

				when compressOutput6 =>
					compressedOutPixelDataColorR <= unsigned(FPU_CNV_OUT(7 downto 0) );
					FPU_CNV_A <= std_logic_vector(wrappedTexcoordTX);
					FPU_CNV_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_To_UNORM16), 3) );
					FPU_CNV_GO <= '1';
					currentState <= compressOutput7;

				when compressOutput7 =>
					compressedOutPixelDataColorG <= unsigned(FPU_CNV_OUT(7 downto 0) );
					FPU_CNV_A <= std_logic_vector(wrappedTexcoordTY);
					FPU_CNV_GO <= '1';
					currentState <= compressOutput8;

				when compressOutput8 =>
					compressedOutPixelDataColorB <= unsigned(FPU_CNV_OUT(7 downto 0) );
					currentState <= compressOutput9;

				when compressOutput9 =>
					compressedOutPixelDataColorA <= unsigned(FPU_CNV_OUT(7 downto 0) );
					currentState <= compressOutput10;

				when compressOutput10 =>
					compressedOutPixelDataTX <= unsigned(FPU_CNV_OUT(15 downto 0) );
					currentState <= compressOutput11;

				when compressOutput11 =>
					compressedOutPixelDataTY <= unsigned(FPU_CNV_OUT(15 downto 0) );
					currentState <= waitingForWrite;

				when waitingForWrite =>
					if (TEXSAMP_OutFIFO_full = '0') then
						TEXSAMP_OutFIFO_wr_data <= std_logic_vector(PackOutputData(storedPixelX, storedPixelY, compressedOutPixelDataTX, compressedOutPixelDataTY, 
							compressedOutPixelDataColorR, compressedOutPixelDataColorG, compressedOutPixelDataColorB, compressedOutPixelDataColorA) );

						TEXSAMP_OutFIFO_wr_en <= '1'; -- Strobe the write request

						currentState <= waitingForRead;
					else
						TEXSAMP_OutFIFO_wr_en <= '0';
					end if;

				when setNewPrimitive =>
					unpackedVertex0.tx <= f32(TRICACHE_inT0X);
					unpackedVertex0.ty <= f32(TRICACHE_inT0Y);
					unpackedVertex10.tx <= f32(TRICACHE_inT10X);
					unpackedVertex10.ty <= f32(TRICACHE_inT10Y);
					unpackedVertex20.tx <= f32(TRICACHE_inT20X);
					unpackedVertex20.ty <= f32(TRICACHE_inT20Y);
					unpackedVertex0.color_r <= f32(TRICACHE_inColorRGBA0(31 downto 0) );
					unpackedVertex0.color_g <= f32(TRICACHE_inColorRGBA0(63 downto 32) );
					unpackedVertex0.color_b <= f32(TRICACHE_inColorRGBA0(95 downto 64) );
					unpackedVertex0.color_a <= f32(TRICACHE_inColorRGBA0(127 downto 96) );
					unpackedVertex10.color_r <= f32(TRICACHE_inColorRGBA10(31 downto 0) );
					unpackedVertex10.color_g <= f32(TRICACHE_inColorRGBA10(63 downto 32) );
					unpackedVertex10.color_b <= f32(TRICACHE_inColorRGBA10(95 downto 64) );
					unpackedVertex10.color_a <= f32(TRICACHE_inColorRGBA10(127 downto 96) );
					unpackedVertex20.color_r <= f32(TRICACHE_inColorRGBA20(31 downto 0) );
					unpackedVertex20.color_g <= f32(TRICACHE_inColorRGBA20(63 downto 32) );
					unpackedVertex20.color_b <= f32(TRICACHE_inColorRGBA20(95 downto 64) );
					unpackedVertex20.color_a <= f32(TRICACHE_inColorRGBA20(127 downto 96) );

					currentState <= waitingForRead;

				when terminateCurrentPrimitive =>
					currentState <= waitingForRead;

			end case;
		end if;
	end process;

end Behavioral;
