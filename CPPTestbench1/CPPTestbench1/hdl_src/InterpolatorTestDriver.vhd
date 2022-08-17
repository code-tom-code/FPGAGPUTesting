library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;

use work.PacketType.all;

entity InterpolatorTestDriver is
	Port ( clk : in STD_LOGIC;
		clklocked : in STD_LOGIC;

	-- TriWorkCache per-triangle interface begin
		TRICACHE_inBarycentricInverse : out STD_LOGIC_VECTOR(31 downto 0) := X"396e6bcd";
		TRICACHE_inInvZ0 : out STD_LOGIC_VECTOR(31 downto 0) := X"3f85795b";
		TRICACHE_inInvZ1 : out STD_LOGIC_VECTOR(31 downto 0) := X"3f85dfc8";
		TRICACHE_inInvZ2 : out STD_LOGIC_VECTOR(31 downto 0) := X"3f89b1d9";
		TRICACHE_inT0X : out STD_LOGIC_VECTOR(15 downto 0) := X"0000";
		TRICACHE_inT0Y : out STD_LOGIC_VECTOR(15 downto 0) := X"0000";
		TRICACHE_inT1X : out STD_LOGIC_VECTOR(15 downto 0) := X"3c00";
		TRICACHE_inT1Y : out STD_LOGIC_VECTOR(15 downto 0) := X"0000";
		TRICACHE_inT2X : out STD_LOGIC_VECTOR(15 downto 0) := X"0000";
		TRICACHE_inT2Y : out STD_LOGIC_VECTOR(15 downto 0) := X"3c00";
		TRICACHE_inColorRGBA0 : out STD_LOGIC_VECTOR(31 downto 0) := X"FF000000";
		TRICACHE_inColorRGBA1 : out STD_LOGIC_VECTOR(31 downto 0) := X"FF0000FF";
		TRICACHE_inColorRGBA2 : out STD_LOGIC_VECTOR(31 downto 0) := X"FF00FF00";

		TRICACHE_CurrentSlotIndex : in STD_LOGIC_VECTOR(1 downto 0);
		TRICACHE_SignalSlotComplete : in STD_LOGIC;
	-- TriWorkCache per-triangle interface end

	-- Rasterizer Output per-pixel interface begin
		RASTOUT_FIFO_wr_data : out STD_LOGIC_VECTOR(32+32+32+16+16 - 1 downto 0) := (others => '0');
		RASTOUT_FIFO_full : in STD_LOGIC;
		RASTOUT_FIFO_wr_en : out STD_LOGIC := '0';
	-- Rasterizer Output per-pixel interface end

	-- Depth Buffer interface begin
		DEPTH_ClearDepthBuffer : out STD_LOGIC := '0';
		DEPTH_ClearDepthValue : out STD_LOGIC_VECTOR(23 downto 0) := X"800000";
		DEPTH_DepthWriteEnable : out STD_LOGIC := '1';
		DEPTH_DepthFunction : out STD_LOGIC_VECTOR(2 downto 0) := "110"; --STD_LOGIC_VECTOR(to_unsigned(eCmpFunc'pos(cmp_greaterequal), 3) );
		DEPTH_SetDepthParams : out STD_LOGIC := '0';
	-- Depth Buffer interface end

	-- Attribute Interpolator interface begin
		TEXSAMP_readyForWrite : out STD_LOGIC := '0';

		TEXSAMP_outInterpolatedTexcoordX : in STD_LOGIC_VECTOR(15 downto 0);
		TEXSAMP_outInterpolatedTexcoordY : in STD_LOGIC_VECTOR(15 downto 0);
		TEXSAMP_outInterpolatedColorRGBA : in STD_LOGIC_VECTOR(31 downto 0);
		TEXSAMP_outPixelX : in STD_LOGIC_VECTOR(15 downto 0);
		TEXSAMP_outPixelY : in STD_LOGIC_VECTOR(15 downto 0);
		TEXSAMP_outWriteIsValid : in STD_LOGIC;
	-- Attribute Interpolator interface end

	-- Debug signals
		DBG_TestDriver_State : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0')
		);
end InterpolatorTestDriver;

architecture Behavioral of InterpolatorTestDriver is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333251231";

ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO FULL";

type testDriverStateType is 
(
	init, -- 0
	
	setupState,

	pushPixelData,

	doneState
);

type testPixelStruct is record
	x : natural;
	y : natural;
	a : natural;
	b : natural;
	c : natural;
end record testPixelStruct;

signal pixelDataIndex : unsigned(7 downto 0) := (others => '0');

type testPixelDataArray is array(0 to 187) of testPixelStruct;

constant testPixelData : testPixelDataArray := (
( x => 189, y => 149, a => 16, b => 38, c => 4344      ),
( x => 187, y => 151, a => 48, b => 114, c => 4236     ),
( x => 188, y => 150, a => 32, b => 76, c => 4290      ),
( x => 189, y => 150, a => 117, b => 3, c => 4278      ),
( x => 188, y => 151, a => 133, b => 41, c => 4224     ),
( x => 185, y => 153, a => 80, b => 190, c => 4128     ),
( x => 188, y => 152, a => 234, b => 6, c => 4158      ),
( x => 183, y => 154, a => 11, b => 301, c => 4086     ),
( x => 182, y => 155, a => 27, b => 339, c => 4032     ),
( x => 183, y => 155, a => 112, b => 266, c => 4020    ),
( x => 186, y => 154, a => 266, b => 82, c => 4050     ),
( x => 187, y => 154, a => 351, b => 9, c => 4038      ),
( x => 186, y => 155, a => 367, b => 47, c => 3984     ),
( x => 181, y => 156, a => 43, b => 377, c => 3978     ),
( x => 180, y => 157, a => 59, b => 415, c => 3924     ),
( x => 181, y => 157, a => 144, b => 342, c => 3912    ),
( x => 186, y => 156, a => 468, b => 12, c => 3918     ),
( x => 177, y => 159, a => 6, b => 564, c => 3828      ),
( x => 179, y => 158, a => 75, b => 453, c => 3870     ),
( x => 178, y => 159, a => 91, b => 491, c => 3816     ),
( x => 179, y => 159, a => 176, b => 418, c => 3804    ),
( x => 184, y => 158, a => 500, b => 88, c => 3810     ),
( x => 185, y => 158, a => 585, b => 15, c => 3798     ),
( x => 184, y => 159, a => 601, b => 53, c => 3744     ),
( x => 175, y => 161, a => 38, b => 640, c => 3720     ),
( x => 184, y => 160, a => 702, b => 18, c => 3678     ),
( x => 173, y => 163, a => 70, b => 716, c => 3612     ),
( x => 182, y => 162, a => 734, b => 94, c => 3570     ),
( x => 183, y => 162, a => 819, b => 21, c => 3558     ),
( x => 182, y => 163, a => 835, b => 59, c => 3504     ),
( x => 171, y => 164, a => 1, b => 827, c => 3570      ),
( x => 170, y => 165, a => 17, b => 865, c => 3516     ),
( x => 171, y => 165, a => 102, b => 792, c => 3504    ),
( x => 182, y => 164, a => 936, b => 24, c => 3438     ),
( x => 169, y => 166, a => 33, b => 903, c => 3462     ),
( x => 168, y => 167, a => 49, b => 941, c => 3408     ),
( x => 169, y => 167, a => 134, b => 868, c => 3396    ),
( x => 180, y => 166, a => 968, b => 100, c => 3330    ),
( x => 181, y => 166, a => 1053, b => 27, c => 3318    ),
( x => 180, y => 167, a => 1069, b => 65, c => 3264    ),
( x => 167, y => 168, a => 65, b => 979, c => 3354     ),
( x => 166, y => 169, a => 81, b => 1017, c => 3300    ),
( x => 167, y => 169, a => 166, b => 944, c => 3288    ),
( x => 180, y => 168, a => 1170, b => 30, c => 3198    ),
( x => 163, y => 171, a => 28, b => 1166, c => 3204    ),
( x => 178, y => 170, a => 1202, b => 106, c => 3090   ),
( x => 179, y => 170, a => 1287, b => 33, c => 3078    ),
( x => 178, y => 171, a => 1303, b => 71, c => 3024    ),
( x => 161, y => 173, a => 60, b => 1242, c => 3096    ),
( x => 178, y => 172, a => 1404, b => 36, c => 2958    ),
( x => 178, y => 173, a => 1505, b => 1, c => 2892     ),
( x => 158, y => 175, a => 7, b => 1391, c => 3000     ),
( x => 159, y => 175, a => 92, b => 1318, c => 2988    ),
( x => 157, y => 176, a => 23, b => 1429, c => 2946    ),
( x => 156, y => 177, a => 39, b => 1467, c => 2892    ),
( x => 157, y => 177, a => 124, b => 1394, c => 2880   ),
( x => 176, y => 176, a => 1638, b => 42, c => 2718    ),
( x => 176, y => 177, a => 1739, b => 7, c => 2652     ),
( x => 155, y => 178, a => 55, b => 1505, c => 2838    ),
( x => 154, y => 179, a => 71, b => 1543, c => 2784    ),
( x => 155, y => 179, a => 156, b => 1470, c => 2772   ),
( x => 151, y => 181, a => 18, b => 1692, c => 2688    ),
( x => 174, y => 180, a => 1872, b => 48, c => 2478    ),
( x => 174, y => 181, a => 1973, b => 13, c => 2412    ),
( x => 149, y => 183, a => 50, b => 1768, c => 2580    ),
( x => 147, y => 185, a => 82, b => 1844, c => 2472    ),
( x => 172, y => 184, a => 2106, b => 54, c => 2238    ),
( x => 172, y => 185, a => 2207, b => 19, c => 2172    ),
( x => 145, y => 186, a => 13, b => 1955, c => 2430    ),
( x => 144, y => 187, a => 29, b => 1993, c => 2376    ),
( x => 145, y => 187, a => 114, b => 1920, c => 2364   ),
( x => 143, y => 188, a => 45, b => 2031, c => 2322    ),
( x => 142, y => 189, a => 61, b => 2069, c => 2268    ),
( x => 143, y => 189, a => 146, b => 1996, c => 2256   ),
( x => 170, y => 188, a => 2340, b => 60, c => 1998    ),
( x => 170, y => 189, a => 2441, b => 25, c => 1932    ),
( x => 139, y => 191, a => 8, b => 2218, c => 2172     ),
( x => 141, y => 190, a => 77, b => 2107, c => 2214    ),
( x => 140, y => 191, a => 93, b => 2145, c => 2160    ),
( x => 141, y => 191, a => 178, b => 2072, c => 2148   ),
( x => 137, y => 193, a => 40, b => 2294, c => 2064    ),
( x => 168, y => 192, a => 2574, b => 66, c => 1758    ),
( x => 168, y => 193, a => 2675, b => 31, c => 1692    ),
( x => 135, y => 195, a => 72, b => 2370, c => 1956    ),
( x => 133, y => 196, a => 3, b => 2481, c => 1914     ),
( x => 132, y => 197, a => 19, b => 2519, c => 1860    ),
( x => 133, y => 197, a => 104, b => 2446, c => 1848   ),
( x => 166, y => 196, a => 2808, b => 72, c => 1518    ),
( x => 166, y => 197, a => 2909, b => 37, c => 1452    ),
( x => 131, y => 198, a => 35, b => 2557, c => 1806    ),
( x => 130, y => 199, a => 51, b => 2595, c => 1752    ),
( x => 131, y => 199, a => 136, b => 2522, c => 1740   ),
( x => 166, y => 198, a => 3010, b => 2, c => 1386     ),
( x => 129, y => 200, a => 67, b => 2633, c => 1698    ),
( x => 128, y => 201, a => 83, b => 2671, c => 1644    ),
( x => 129, y => 201, a => 168, b => 2598, c => 1632   ),
( x => 164, y => 200, a => 3042, b => 78, c => 1278    ),
( x => 165, y => 200, a => 3127, b => 5, c => 1266     ),
( x => 164, y => 201, a => 3143, b => 43, c => 1212    ),
( x => 125, y => 203, a => 30, b => 2820, c => 1548    ),
( x => 164, y => 202, a => 3244, b => 8, c => 1146     ),
( x => 123, y => 205, a => 62, b => 2896, c => 1440    ),
( x => 162, y => 204, a => 3276, b => 84, c => 1038    ),
( x => 163, y => 204, a => 3361, b => 11, c => 1026    ),
( x => 162, y => 205, a => 3377, b => 49, c => 972     ),
( x => 120, y => 207, a => 9, b => 3045, c => 1344     ),
( x => 121, y => 207, a => 94, b => 2972, c => 1332    ),
( x => 162, y => 206, a => 3478, b => 14, c => 906     ),
( x => 119, y => 208, a => 25, b => 3083, c => 1290    ),
( x => 118, y => 209, a => 41, b => 3121, c => 1236    ),
( x => 119, y => 209, a => 126, b => 3048, c => 1224   ),
( x => 160, y => 208, a => 3510, b => 90, c => 798     ),
( x => 161, y => 208, a => 3595, b => 17, c => 786     ),
( x => 160, y => 209, a => 3611, b => 55, c => 732     ),
( x => 117, y => 210, a => 57, b => 3159, c => 1182    ),
( x => 116, y => 211, a => 73, b => 3197, c => 1128    ),
( x => 117, y => 211, a => 158, b => 3124, c => 1116   ),
( x => 160, y => 210, a => 3712, b => 20, c => 666     ),
( x => 113, y => 213, a => 20, b => 3346, c => 1032    ),
( x => 158, y => 212, a => 3744, b => 96, c => 558     ),
( x => 159, y => 212, a => 3829, b => 23, c => 546     ),
( x => 158, y => 213, a => 3845, b => 61, c => 492     ),
( x => 111, y => 215, a => 52, b => 3422, c => 924     ),
( x => 158, y => 214, a => 3946, b => 26, c => 426     ),
( x => 109, y => 217, a => 84, b => 3498, c => 816     ),
( x => 156, y => 216, a => 3978, b => 102, c => 318    ),
( x => 157, y => 216, a => 4063, b => 29, c => 306     ),
( x => 156, y => 217, a => 4079, b => 67, c => 252     ),
( x => 107, y => 218, a => 15, b => 3609, c => 774     ),
( x => 106, y => 219, a => 31, b => 3647, c => 720     ),
( x => 107, y => 219, a => 116, b => 3574, c => 708    ),
( x => 156, y => 218, a => 4180, b => 32, c => 186     ),
( x => 105, y => 220, a => 47, b => 3685, c => 666     ),
( x => 104, y => 221, a => 63, b => 3723, c => 612     ),
( x => 105, y => 221, a => 148, b => 3650, c => 600    ),
( x => 154, y => 220, a => 4212, b => 108, c => 78     ),
( x => 155, y => 220, a => 4297, b => 35, c => 66      ),
( x => 154, y => 221, a => 4313, b => 73, c => 12      ),
( x => 101, y => 223, a => 10, b => 3872, c => 516     ),
( x => 103, y => 222, a => 79, b => 3761, c => 558     ),
( x => 102, y => 223, a => 95, b => 3799, c => 504     ),
( x => 103, y => 223, a => 180, b => 3726, c => 492    ),
( x => 144, y => 222, a => 3564, b => 768, c => 66     ),
( x => 145, y => 222, a => 3649, b => 695, c => 54     ),
( x => 146, y => 222, a => 3734, b => 622, c => 42     ),
( x => 147, y => 222, a => 3819, b => 549, c => 30     ),
( x => 148, y => 222, a => 3904, b => 476, c => 18     ),
( x => 149, y => 222, a => 3989, b => 403, c => 6      ),
( x => 99, y => 225, a => 42, b => 3948, c => 408      ),
( x => 132, y => 224, a => 2746, b => 1574, c => 78    ),
( x => 133, y => 224, a => 2831, b => 1501, c => 66    ),
( x => 132, y => 225, a => 2847, b => 1539, c => 12    ),
( x => 134, y => 224, a => 2916, b => 1428, c => 54    ),
( x => 135, y => 224, a => 3001, b => 1355, c => 42    ),
( x => 136, y => 224, a => 3086, b => 1282, c => 30    ),
( x => 137, y => 224, a => 3171, b => 1209, c => 18    ),
( x => 138, y => 224, a => 3256, b => 1136, c => 6     ),
( x => 97, y => 227, a => 74, b => 4024, c => 300      ),
( x => 122, y => 226, a => 2098, b => 2234, c => 66    ),
( x => 123, y => 226, a => 2183, b => 2161, c => 54    ),
( x => 124, y => 226, a => 2268, b => 2088, c => 42    ),
( x => 125, y => 226, a => 2353, b => 2015, c => 30    ),
( x => 126, y => 226, a => 2438, b => 1942, c => 18    ),
( x => 127, y => 226, a => 2523, b => 1869, c => 6     ),
( x => 95, y => 228, a => 5, b => 4135, c => 258       ),
( x => 94, y => 229, a => 21, b => 4173, c => 204      ),
( x => 95, y => 229, a => 106, b => 4100, c => 192     ),
( x => 110, y => 228, a => 1280, b => 3040, c => 78    ),
( x => 111, y => 228, a => 1365, b => 2967, c => 66    ),
( x => 110, y => 229, a => 1381, b => 3005, c => 12    ),
( x => 112, y => 228, a => 1450, b => 2894, c => 54    ),
( x => 113, y => 228, a => 1535, b => 2821, c => 42    ),
( x => 114, y => 228, a => 1620, b => 2748, c => 30    ),
( x => 115, y => 228, a => 1705, b => 2675, c => 18    ),
( x => 116, y => 228, a => 1790, b => 2602, c => 6     ),
( x => 93, y => 230, a => 37, b => 4211, c => 150      ),
( x => 92, y => 231, a => 53, b => 4249, c => 96       ),
( x => 93, y => 231, a => 138, b => 4176, c => 84      ),
( x => 100, y => 230, a => 632, b => 3700, c => 66     ),
( x => 101, y => 230, a => 717, b => 3627, c => 54     ),
( x => 102, y => 230, a => 802, b => 3554, c => 42     ),
( x => 103, y => 230, a => 887, b => 3481, c => 30     ),
( x => 104, y => 230, a => 972, b => 3408, c => 18     ),
( x => 105, y => 230, a => 1057, b => 3335, c => 6     ),
( x => 91, y => 232, a => 69, b => 4287, c => 42       ),
( x => 92, y => 232, a => 154, b => 4214, c => 30      ),
( x => 93, y => 232, a => 239, b => 4141, c => 18      ),
( x => 94, y => 232, a => 324, b => 4068, c => 6       )
);

signal currentState : testDriverStateType := init;

pure function GetPixelData(index : unsigned(7 downto 0) ) return unsigned is
	variable exx : unsigned(15 downto 0);
	variable exy : unsigned(15 downto 0);
	variable exa : unsigned(31 downto 0);
	variable exb : unsigned(31 downto 0);
	variable exc : unsigned(31 downto 0);
begin
	exx := to_unsigned(testPixelData(to_integer(index) ).x, 16);
	exy := to_unsigned(testPixelData(to_integer(index) ).y, 16);
	exa := to_unsigned(testPixelData(to_integer(index) ).a, 32);
	exb := to_unsigned(testPixelData(to_integer(index) ).b, 32);
	exc := to_unsigned(testPixelData(to_integer(index) ).c, 32);

	return exy & exx & exc & exb & exa;
end function;

begin

DBG_TestDriver_State <= std_logic_vector(to_unsigned(testDriverStateType'pos(currentState), 7) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when init =>
					RASTOUT_FIFO_wr_en <= '0';
					if (clklocked = '1') then
						currentState <= setupState;
					end if;

				when setupState =>
					DEPTH_SetDepthParams <= '1';
					currentState <= pushPixelData;

				when pushPixelData =>
					TEXSAMP_readyForWrite <= '1';
					DEPTH_SetDepthParams <= '0';
					RASTOUT_FIFO_wr_data <= std_logic_vector(GetPixelData(pixelDataIndex) );
					RASTOUT_FIFO_wr_en <= '1';
					pixelDataIndex <= pixelDataIndex + 1;
					if (pixelDataIndex >= 185) then
						RASTOUT_FIFO_wr_en <= '0';
						currentState <= doneState;
					end if;

				when doneState =>
					RASTOUT_FIFO_wr_en <= '0';

			end case;
		end if;
	end process;

end Behavioral;
