library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Include the PacketType library so that we can use the eCmpFunc and eStencilOp types
library work;
use work.PacketType.all;

entity DepthBuffer is
	generic (
		NUM_PIPELINE_STAGES : natural range 2 to 31 := 4
	);
    Port (
		clk	: in std_logic;

	-- Per-pixel input data begin
		RAST_PixelReady : in STD_LOGIC;
		RAST_PosX : in STD_LOGIC_VECTOR(9 downto 0);
		RAST_PosY : in STD_LOGIC_VECTOR(9 downto 0);
		RAST_InPixelDepth : in STD_LOGIC_VECTOR(23 downto 0);
	-- Per-pixel input data end

	-- State config data begin
		RAST_SetDepthParams : in STD_LOGIC;
		RAST_DepthWriteEnable : in STD_LOGIC;
		RAST_DepthFunction : in STD_LOGIC_VECTOR(2 downto 0);
		RAST_DepthIsIdle : out STD_LOGIC := '0';
		RAST_StencilWriteEnable : in STD_LOGIC;
		RAST_StencilRefVal : in STD_LOGIC_VECTOR(7 downto 0);
		RAST_StencilReadMask : in STD_LOGIC_VECTOR(7 downto 0);
		RAST_StencilWriteMask : in STD_LOGIC_VECTOR(7 downto 0);
		RAST_StencilCmpFunc : in STD_LOGIC_VECTOR(2 downto 0);
		RAST_StencilFailOp : in STD_LOGIC_VECTOR(2 downto 0);
		RAST_StencilZFailOp : in STD_LOGIC_VECTOR(2 downto 0);
		RAST_StencilPassOp : in STD_LOGIC_VECTOR(2 downto 0);
	-- State config data end

	-- Per-pixel output data begin
		RAST_PixelPassedDepthStencilTest : out STD_LOGIC := '0';
		RAST_PixelFailedDepthTest : out STD_LOGIC := '0';
		RAST_PixelFailedStencilTest : out STD_LOGIC := '0';
	-- Per-pixel output data end

	-- URAM Interface begin
		URAM_addra : out STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
		URAM_clka : out STD_LOGIC := '0';
		URAM_dina : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0');
		URAM_ena : out STD_LOGIC := '1';
		URAM_wea : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

		URAM_addrb : out STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
		URAM_clkb : out STD_LOGIC := '0';
		URAM_doutb : in STD_LOGIC_VECTOR(63 downto 0);
		URAM_enb : out STD_LOGIC := '1';
	-- URAM Interface end

	-- Command Processor interface begin
		CMD_ClearDepthBuffer : in STD_LOGIC;
		CMD_ClearStencilBuffer : in STD_LOGIC;
		CMD_ClearDepthValue : in STD_LOGIC_VECTOR(23 downto 0);
		CMD_ClearStencilValue : in STD_LOGIC_VECTOR(7 downto 0);
		CMD_DepthIsIdle : out STD_LOGIC := '0';
	-- Command Processor interface end

	-- Stats interface begin
		STAT_PixelsPassedDepthStencilTest : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_PixelsFailedDepthTest : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_PixelsFailedStencilTest : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
	-- Stats interface end
		);
end DepthBuffer;

architecture Behavioral of DepthBuffer is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

	ATTRIBUTE X_INTERFACE_INFO of URAM_clka: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of URAM_clka: SIGNAL is "FREQ_HZ 333250000";
	ATTRIBUTE X_INTERFACE_INFO of URAM_ena: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW EN";
	ATTRIBUTE X_INTERFACE_INFO of URAM_dina: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW DIN";
	ATTRIBUTE X_INTERFACE_INFO of URAM_wea: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW WE";
	ATTRIBUTE X_INTERFACE_INFO of URAM_addra: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR";

	ATTRIBUTE X_INTERFACE_INFO of URAM_clkb: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMR CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of URAM_clkb: SIGNAL is "FREQ_HZ 333250000";
	ATTRIBUTE X_INTERFACE_INFO of URAM_enb: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMR EN";
	ATTRIBUTE X_INTERFACE_INFO of URAM_addrb: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR";
	ATTRIBUTE X_INTERFACE_INFO of URAM_doutb: SIGNAL is "xilinx.com:interface:bram:1.0 DBufferRAMR DOUT";

	type PipelineDepthTest is record
		pixelEnabled : std_logic;
		isOddAddress : std_logic;
		pixelAddress : unsigned(17 downto 0);
		pixelTestDepth : unsigned(23 downto 0);
	end record PipelineDepthTest;

	constant DefaultPipelineDepthTestVal : PipelineDepthTest := (pixelEnabled => '0', isOddAddress => '0', pixelAddress => (others => '0'), pixelTestDepth => (others => '0') );

	type PipelineDepthTestArrayType is array(NUM_PIPELINE_STAGES downto 0) of PipelineDepthTest;

	signal currentDepthCompareFunc : eCmpFunc := cmp_lessequal; -- D3DRS_ZFUNC defaults to D3DCMP_LESSEQUAL
	signal depthWriteEnable : std_logic := '1'; -- D3DRS_ZWRITEENABLE defaults to TRUE
	signal stencilWriteEnable : std_logic := '0'; -- D3DRS_STENCILENABLE defaults to FALSE
	signal stencilRef : unsigned(7 downto 0) := (others => '0'); -- D3DRS_STENCILREF defaults to 0x00
	signal stencilReadMask : unsigned(7 downto 0) := (others => '1'); -- D3DRS_STENCILMASK defaults to 0xFF
	signal stencilWriteMask : unsigned(7 downto 0) := (others => '1'); -- D3DRS_STENCILWRITEMASK defaults to 0xFF
	signal currentStencilCompareFunc : eCmpFunc := cmp_always; -- D3DRS_STENCILFUNC defaults to D3DCMP_ALWAYS
	signal stencilFailOp : eStencilOp := sop_keep; -- D3DRS_STENCILFAIL defaults to D3DSTENCILOP_KEEP
	signal stencilZFailOp : eStencilOp := sop_keep; -- D3DRS_STENCILZFAIL defaults to D3DSTENCILOP_KEEP
	signal stencilPassOp : eStencilOp := sop_keep; -- D3DRS_STENCILPASS defaults to D3DSTENCILOP_KEEP

	-- Clear mode registers:
	signal clearSaveDepthCompareFunc : eCmpFunc := cmp_lessequal;
	signal clearSaveStencilCompareFunc : eCmpFunc := cmp_always; -- D3DRS_STENCILFUNC defaults to D3DCMP_ALWAYS
	signal clearSaveDepthWriteEnable : std_logic := '1';
	signal clearSaveStencilWriteEnable : std_logic := '0';
	signal clearSaveStencilRef : unsigned(7 downto 0) := (others => '0');
	signal clearSaveStencilPassOp : eStencilOp := sop_keep;
	signal clearSaveStencilWriteMask : unsigned(7 downto 0) := (others => '1');
	signal clearModeEnable : std_logic := '0';
	signal clearModeAddress : unsigned(17 downto 0) := (others => '0');
	signal clearDepthValue : unsigned(23 downto 0) := (others => '0');
	signal clearModeCompleted : std_logic := '0';
	constant finishClearPixelCount : natural := ( (480-1) * (640/2) + ( (640/2)-1) );

	signal depthPipeline : PipelineDepthTestArrayType := (others => DefaultPipelineDepthTestVal);

	signal pixelsPassedDepthStencilTest : unsigned(31 downto 0) := (others => '0');
	signal pixelsFailedDepthTest : unsigned(31 downto 0) := (others => '0');
	signal pixelsFailedStencilTest : unsigned(31 downto 0) := (others => '0');

	pure function MultiplyBy320(value : unsigned(9 downto 0) ) return unsigned is
	begin
		return ( (resize(value, 18) sll 6) + (resize(value, 18) sll 8) );
	end function;

	-- Returns true if the pixel passed the depth test, or false if the pixel didn't pass the depth test
	pure function DepthTest(depthFunc : eCmpFunc; testPixelValue : unsigned(23 downto 0); depthBufferCurrentValue : unsigned(23 downto 0) ) return boolean is
		variable lessTest : boolean;
		variable equalTest : boolean;
	begin
		-- We only need to perform two actual comparisons to be able to support the 8 possible comparison functions using combinations of just "less" and "equal":
		lessTest := testPixelValue < depthBufferCurrentValue;
		equalTest := testPixelValue = depthBufferCurrentValue;

		case depthFunc is
			when cmp_less =>
				return lessTest;
			when cmp_equal =>
				return equalTest;
			when cmp_lessequal =>
				return lessTest or equalTest;
			when cmp_greater =>
				return not (lessTest or equalTest);
			when cmp_notequal =>
				return not equalTest;
			when cmp_greaterequal =>
				return not lessTest;
			when cmp_always =>
				return true;
			when others => -- when cmp_never =>
				return false;
		end case;
	end function;

	-- Returns true if the pixel passed the stencil test, or false if the pixel didn't pass the stencil test
	pure function StencilTest(stencilFunc : eCmpFunc; stencilReferenceValue : unsigned(7 downto 0); stencilBufferCurrentValue : unsigned(7 downto 0) ) return boolean is
		variable lessTest : boolean;
		variable equalTest : boolean;
	begin
		-- We only need to perform two actual comparisons to be able to support the 8 possible comparison functions using combinations of just "less" and "equal":
		lessTest := stencilReferenceValue < stencilBufferCurrentValue;
		equalTest := stencilReferenceValue = stencilBufferCurrentValue;

		case stencilFunc is
			when cmp_less =>
				return lessTest;
			when cmp_equal =>
				return equalTest;
			when cmp_lessequal =>
				return lessTest or equalTest;
			when cmp_greater =>
				return not (lessTest or equalTest);
			when cmp_notequal =>
				return not equalTest;
			when cmp_greaterequal =>
				return not lessTest;
			when cmp_always =>
				return true;
			when others => -- when cmp_never =>
				return false;
		end case;
	end function;

	pure function ApplyStencilOp(stencilReferenceValue : unsigned(7 downto 0); stencilBufferCurrentValue : unsigned(7 downto 0); stencilWriteMask : unsigned(7 downto 0); stencilOpPerform : eStencilOp) return unsigned is
		variable resultStencilVal : unsigned(7 downto 0);
	begin
		case stencilOpPerform is
			when sop_keep =>
				resultStencilVal := stencilBufferCurrentValue;
			when sop_zero =>
				resultStencilVal := X"00";
			when sop_replace =>
				resultStencilVal := stencilReferenceValue;
			when sop_incr_sat =>
				if (stencilBufferCurrentValue = X"FF") then
					resultStencilVal := X"FF";
				else
					resultStencilVal := (stencilBufferCurrentValue + 1);
				end if;
			when sop_decr_sat =>
				if (stencilBufferCurrentValue = X"00") then
					resultStencilVal := X"00";
				else
					resultStencilVal := (stencilBufferCurrentValue - 1);
				end if;
			when sop_invert =>
				resultStencilVal := not stencilBufferCurrentValue;
			when sop_incr =>
				resultStencilVal := (stencilBufferCurrentValue + 1);
			when others => -- when sop_decr =>
				resultStencilVal := (stencilBufferCurrentValue - 1);
		end case;
		return (resultStencilVal and stencilWriteMask) or (stencilBufferCurrentValue and not stencilWriteMask);
	end function;

	pure function EvaluateNewStencilValue(stencilTestPassed : boolean; depthTestPassed : boolean; stencilReferenceValue : unsigned(7 downto 0); stencilBufferCurrentValue : unsigned(7 downto 0); stencilWriteMask : unsigned(7 downto 0);
		stencilTestFailOp : eStencilOp; depthTestFailOp : eStencilOp; stencilTestPassOp : eStencilOp) return unsigned is
	begin
		if (stencilTestPassed = false) then
			-- Apply "stencil fail" op
			return ApplyStencilOp(stencilReferenceValue, stencilBufferCurrentValue, stencilWriteMask, stencilTestFailOp);
		elsif (depthTestPassed = false) then
			-- Apply "Z fail" op
			return ApplyStencilOp(stencilReferenceValue, stencilBufferCurrentValue, stencilWriteMask, depthTestFailOp);
		else
			-- Apply "stencil pass" op
			return ApplyStencilOp(stencilReferenceValue, stencilBufferCurrentValue, stencilWriteMask, stencilTestPassOp);
		end if;
	end function;

	pure function DepthBufferBlockIsIdle(depthPipelineArray : PipelineDepthTestArrayType) return std_logic is
	begin
		for i in 0 to NUM_PIPELINE_STAGES loop
			if (depthPipelineArray(i).pixelEnabled = '1') then
				return '0';
			end if;
		end loop;
		return '1';
	end function;

begin
	STAT_PixelsPassedDepthStencilTest <= std_logic_vector(pixelsPassedDepthStencilTest);
	STAT_PixelsFailedDepthTest <= std_logic_vector(pixelsFailedDepthTest);
	STAT_PixelsFailedStencilTest <= std_logic_vector(pixelsFailedStencilTest);

	URAM_clka <= clk;
	URAM_clkb <= clk;

	setParamsProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (clearModeEnable = '1') then -- Currently in the middle of performing a full-buffer clear:
				if (clearModeCompleted = '1') then -- Clear is finally completed!
					clearModeEnable <= '0';

					-- Restore our depth setup to what it was originally
					currentDepthCompareFunc <= clearSaveDepthCompareFunc;
					depthWriteEnable <= clearSaveDepthWriteEnable;

					-- Restore our stencil setup to what it was originally
					stencilWriteEnable <= clearSaveStencilWriteEnable;
					currentStencilCompareFunc <= clearSaveStencilCompareFunc;
					stencilRef <= clearSaveStencilRef;
					stencilPassOp <= clearSaveStencilPassOp;
					stencilWriteMask <= clearSaveStencilWriteMask;
				end if;

				CMD_DepthIsIdle <= '0';
				RAST_DepthIsIdle <= '0';
			else
				if (RAST_SetDepthParams = '1') then
					currentDepthCompareFunc <= eCmpFunc'val(to_integer(unsigned(RAST_DepthFunction) ) );
					depthWriteEnable <= RAST_DepthWriteEnable;
					stencilWriteEnable <= RAST_StencilWriteEnable;
					stencilRef <= unsigned(RAST_StencilRefVal);
					stencilReadMask <= unsigned(RAST_StencilReadMask);
					stencilWriteMask <= unsigned(RAST_StencilWriteMask);
					currentStencilCompareFunc <= eCmpFunc'val(to_integer(unsigned(RAST_StencilCmpFunc) ) );
					stencilFailOp <= eStencilOp'val(to_integer(unsigned(RAST_StencilFailOp) ) );
					stencilZFailOp <= eStencilOp'val(to_integer(unsigned(RAST_StencilZFailOp) ) );
					stencilPassOp <= eStencilOp'val(to_integer(unsigned(RAST_StencilPassOp) ) );
					CMD_DepthIsIdle <= '0';
					RAST_DepthIsIdle <= '0';
				elsif (CMD_ClearDepthBuffer = '1' or CMD_ClearStencilBuffer = '1') then
					clearModeEnable <= '1';

					-- Save our depth func and depth write enable state to be restored after the clear finishes
					clearSaveDepthCompareFunc <= currentDepthCompareFunc;
					clearSaveDepthWriteEnable <= depthWriteEnable;
					clearDepthValue <= unsigned(CMD_ClearDepthValue);

					-- Save our stencil state to be restored when the clear finishes also
					clearSaveStencilWriteEnable <= stencilWriteEnable;
					clearSaveStencilCompareFunc <= currentStencilCompareFunc;
					clearSaveStencilRef <= stencilRef;
					clearSaveStencilPassOp <= stencilPassOp;
					clearSaveStencilWriteMask <= stencilWriteMask;

					-- Override our depth settings to D3DRS_ZWRITEENABLE=1 and D3DRS_ZFUNC=D3DCMP_ALWAYS for the duration of the Clear process:
					currentDepthCompareFunc <= cmp_always;
					currentStencilCompareFunc <= cmp_always;
					depthWriteEnable <= CMD_ClearDepthBuffer;
					stencilWriteEnable <= CMD_ClearStencilBuffer;
					stencilRef <= unsigned(CMD_ClearStencilValue);
					stencilPassOp <= sop_replace;
					stencilWriteMask <= X"FF";

					CMD_DepthIsIdle <= '0';
					RAST_DepthIsIdle <= '0';
				else
					CMD_DepthIsIdle <= DepthBufferBlockIsIdle(depthPipeline) and not RAST_PixelReady;
					RAST_DepthIsIdle <= DepthBufferBlockIsIdle(depthPipeline) and not RAST_PixelReady;
				end if;
			end if;
		end if;
	end process setParamsProcess;

	clearProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (clearModeEnable = '1') then
				if (clearModeAddress >= finishClearPixelCount) then
					clearModeAddress <= (others => '0');
					clearModeCompleted <= '1';
				else
					clearModeAddress <= clearModeAddress + 1;
					clearModeCompleted <= '0';
				end if;
			end if;
		end if;
	end process clearProcess;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			for i in 1 to NUM_PIPELINE_STAGES loop
				depthPipeline(i) <= depthPipeline(i - 1);
			end loop;

			depthPipeline(0) <= DefaultPipelineDepthTestVal;
			depthPipeline(0).pixelEnabled <= RAST_PixelReady;
			if (clearModeEnable = '1') then
				depthPipeline(0).pixelEnabled <= '1';
				depthPipeline(0).isOddAddress <= '0';
				depthPipeline(0).pixelAddress <= clearModeAddress;
				depthPipeline(0).pixelTestDepth <= clearDepthValue;
				URAM_addrb <= (others => '0');
			elsif (RAST_PixelReady = '1') then
				depthPipeline(0).isOddAddress <= RAST_PosX(0);
				depthPipeline(0).pixelAddress <= MultiplyBy320(unsigned(RAST_PosY) ) + unsigned(RAST_PosX(9 downto 1) );
				depthPipeline(0).pixelTestDepth <= unsigned(RAST_InPixelDepth);
				URAM_addrb <= std_logic_vector(MultiplyBy320(unsigned(RAST_PosY) ) + unsigned(RAST_PosX(9 downto 1) ) );
			end if;
		end if;
	end process;

	process(clk)
		variable passedDepthTest : boolean;
		variable passedStencilTest : boolean;
		variable passedDepthStencilTests : boolean;
		variable newStencilWriteValue : unsigned(7 downto 0);
		variable currentFrameReadDepthValue : unsigned(23 downto 0);
		variable currentFrameReadStencilValue : unsigned(7 downto 0);
		variable currentPixelDepthValue : unsigned(23 downto 0);
	begin
		if (rising_edge(clk) ) then
			RAST_PixelPassedDepthStencilTest <= '0';
			RAST_PixelFailedDepthTest <= '0';
			RAST_PixelFailedStencilTest <= '0';
			URAM_wea <= (others => '0');

			if (depthPipeline(NUM_PIPELINE_STAGES).isOddAddress = '0') then
				currentFrameReadDepthValue := unsigned(URAM_doutb(23 downto 0) );
				currentFrameReadStencilValue := unsigned(URAM_doutb(31 downto 24) );
			else
				currentFrameReadDepthValue := unsigned(URAM_doutb(55 downto 32) );
				currentFrameReadStencilValue := unsigned(URAM_doutb(63 downto 56) );
			end if;
			currentPixelDepthValue := depthPipeline(NUM_PIPELINE_STAGES).pixelTestDepth;
			passedDepthTest := DepthTest(currentDepthCompareFunc, currentPixelDepthValue, currentFrameReadDepthValue);
			passedStencilTest := StencilTest(currentStencilCompareFunc, stencilRef and stencilReadMask, currentFrameReadStencilValue and stencilReadMask);
			passedDepthStencilTests := passedDepthTest and passedStencilTest;

			newStencilWriteValue := EvaluateNewStencilValue(passedStencilTest, passedDepthTest, stencilRef, currentFrameReadStencilValue, stencilWriteMask, stencilFailOp, stencilZFailOp, stencilPassOp);

			URAM_addra <= std_logic_vector(depthPipeline(NUM_PIPELINE_STAGES).pixelAddress);
			URAM_dina(63 downto 56) <= std_logic_vector(newStencilWriteValue);
			URAM_dina(55 downto 32) <= std_logic_vector(currentPixelDepthValue);
			URAM_dina(31 downto 24) <= std_logic_vector(newStencilWriteValue);
			URAM_dina(23 downto 0) <= std_logic_vector(currentPixelDepthValue);
			if (depthPipeline(NUM_PIPELINE_STAGES).pixelEnabled = '1') then
				if (passedDepthStencilTests) then
					RAST_PixelPassedDepthStencilTest <= '1';

					if (depthWriteEnable = '1' or stencilWriteEnable = '1') then
						if (clearModeEnable = '0') then
							if (depthPipeline(NUM_PIPELINE_STAGES).isOddAddress = '0') then
								URAM_wea <= "0000" & stencilWriteEnable & depthWriteEnable & depthWriteEnable & depthWriteEnable;
							else
								URAM_wea <= stencilWriteEnable & depthWriteEnable & depthWriteEnable & depthWriteEnable & "0000";
							end if;
						else
							URAM_wea <= stencilWriteEnable & depthWriteEnable & depthWriteEnable & depthWriteEnable & stencilWriteEnable & depthWriteEnable & depthWriteEnable & depthWriteEnable;
						end if;
					end if;

					if (clearModeEnable = '0') then
						pixelsPassedDepthStencilTest <= pixelsPassedDepthStencilTest + 1;
					end if;
				elsif (passedDepthTest = false) then -- We need to handle the special case of stencil ZFail ops here where they can still write to the stencil buffer even when the depth test fails:
					RAST_PixelFailedDepthTest <= '1';
					pixelsFailedDepthTest <= pixelsFailedDepthTest + 1;
					if (stencilWriteEnable = '1' and stencilZFailOp /= sop_keep) then
						if (depthPipeline(NUM_PIPELINE_STAGES).isOddAddress = '0') then
							URAM_wea <= "00001000"; -- Only update stencil bits here, do not update depth bits in this special case
						else
							URAM_wea <= "10000000"; -- Only update stencil bits here, do not update depth bits in this special case
						end if;
					end if;
				elsif (passedStencilTest = false) then
					RAST_PixelFailedStencilTest <= '1';
					pixelsFailedStencilTest <= pixelsFailedStencilTest + 1;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
