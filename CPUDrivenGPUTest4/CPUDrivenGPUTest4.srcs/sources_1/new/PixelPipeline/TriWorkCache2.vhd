library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TriWorkCache2 is
		Port ( clk : in STD_LOGIC;

		-- Depth Interpolator per-triangle interface begin
			DINTERP_outBarycentricInverse : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			DINTERP_outZ0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			DINTERP_outZ10 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			DINTERP_outZ20 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			DINTERP_outInvW0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			DINTERP_outInvW10 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			DINTERP_outInvW20 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

			DINTERP_PopTriangleSlot : in STD_LOGIC;
		-- Depth Interpolator per-triangle interface end

		-- Attribute Interpolator per-triangle interface begin
			INTERP_outT0X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT0Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT10X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT10Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT20X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT20Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outColorRGBA0 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
			INTERP_outColorRGBA10 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
			INTERP_outColorRGBA20 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');

			INTERP_PopTriangleSlot : in STD_LOGIC;
		-- Attribute Interpolator per-triangle interface end

		-- Rasterizer interface begin
			RAST_inBarycentricInverse : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inZ0 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inZ10 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inZ20 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inInvW0 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inInvW10 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inInvW20 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inT0X : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inT0Y : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inT10X : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inT10Y : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inT20X : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inT20Y : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inColorRGBA0 : in STD_LOGIC_VECTOR(127 downto 0);
			RAST_inColorRGBA10 : in STD_LOGIC_VECTOR(127 downto 0);
			RAST_inColorRGBA20 : in STD_LOGIC_VECTOR(127 downto 0);

			RAST_PushNewTriData : in STD_LOGIC;
			RAST_IsFull : out STD_LOGIC := '0';
		-- Rasterizer interface end

		-- Storage FIFO's interfaces begin
			DINTERP_TRIDATA_FIFO_empty : in STD_LOGIC;
			DINTERP_TRIDATA_FIFO_rd_data : in STD_LOGIC_VECTOR(224-1 downto 0);
			DINTERP_TRIDATA_FIFO_rd_en : out STD_LOGIC := '0';
			DINTERP_TRIDATA_FIFO_full : in STD_LOGIC;
			DINTERP_TRIDATA_FIFO_wr_data : out STD_LOGIC_VECTOR(224-1 downto 0) := (others => '0');
			DINTERP_TRIDATA_FIFO_wr_en : out STD_LOGIC := '0';

			INTERP_TRIDATA_FIFO_empty : in STD_LOGIC;
			INTERP_TRIDATA_FIFO_rd_data : in STD_LOGIC_VECTOR(576-1 downto 0);
			INTERP_TRIDATA_FIFO_rd_en : out STD_LOGIC := '0';
			INTERP_TRIDATA_FIFO_full : in STD_LOGIC;
			INTERP_TRIDATA_FIFO_wr_data : out STD_LOGIC_VECTOR(576-1 downto 0) := (others => '0');
			INTERP_TRIDATA_FIFO_wr_en : out STD_LOGIC := '0'
		-- Storage FIFO's interfaces end
			);
end TriWorkCache2;

architecture Behavioral of TriWorkCache2 is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of DINTERP_TRIDATA_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_TRIDATA_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_EN";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_TRIDATA_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD EMPTY";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_TRIDATA_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_TRIDATA_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_EN";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_TRIDATA_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR FULL";

ATTRIBUTE X_INTERFACE_INFO of INTERP_TRIDATA_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of INTERP_TRIDATA_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_EN";
ATTRIBUTE X_INTERFACE_INFO of INTERP_TRIDATA_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD EMPTY";
ATTRIBUTE X_INTERFACE_INFO of INTERP_TRIDATA_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of INTERP_TRIDATA_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_EN";
ATTRIBUTE X_INTERFACE_INFO of INTERP_TRIDATA_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR FULL";

type DInterpTriData is record
	BarycentricInverse : std_logic_vector(31 downto 0);
	Z0 : std_logic_vector(31 downto 0);
	Z10 : std_logic_vector(31 downto 0);
	Z20 : std_logic_vector(31 downto 0);
	InvW0 : std_logic_vector(31 downto 0);
	InvW10 : std_logic_vector(31 downto 0);
	InvW20 : std_logic_vector(31 downto 0);
end record DInterpTriData;

type InterpTriData is record
	TX0 : std_logic_vector(31 downto 0);
	TX10 : std_logic_vector(31 downto 0);
	TX20 : std_logic_vector(31 downto 0);
	TY0 : std_logic_vector(31 downto 0);
	TY10 : std_logic_vector(31 downto 0);
	TY20 : std_logic_vector(31 downto 0);
	RGBA0 : std_logic_vector(127 downto 0);
	RGBA10 : std_logic_vector(127 downto 0);
	RGBA20 : std_logic_vector(127 downto 0);
end record InterpTriData;

pure function SerializeDInterpTriData(BarycentricInverse : std_logic_vector(31 downto 0); 
	Z0 : std_logic_vector(31 downto 0); Z10 : std_logic_vector(31 downto 0); Z20 : std_logic_vector(31 downto 0);
	InvW0 : std_logic_vector(31 downto 0); InvW10 : std_logic_vector(31 downto 0); InvW20 : std_logic_vector(31 downto 0) ) return std_logic_vector is
begin
	return InvW20
		& InvW10
		& InvW0
		& Z20
		& Z10
		& Z0
		& BarycentricInverse;
end function;

pure function SerializeAttrInterpTriData(TX0 : std_logic_vector(31 downto 0); TX10 : std_logic_vector(31 downto 0); TX20 : std_logic_vector(31 downto 0);
	TY0 : std_logic_vector(31 downto 0); TY10 : std_logic_vector(31 downto 0); TY20 : std_logic_vector(31 downto 0);
	RGBA0 : std_logic_vector(127 downto 0); RGBA10 : std_logic_vector(127 downto 0); RGBA20 : std_logic_vector(127 downto 0) ) return std_logic_vector is
begin
	return RGBA20
		& RGBA10
		& RGBA0
		& TY20
		& TY10
		& TY0
		& TX20
		& TX10
		& TX0;
end function;

pure function DeserializeDInterpTriData(SerializedData : std_logic_vector(224-1 downto 0) ) return DInterpTriData is
	variable ret : DInterpTriData;
begin
	ret.BarycentricInverse := SerializedData(31 downto 0);
	ret.Z0 := SerializedData(63 downto 32);
	ret.Z10 := SerializedData(95 downto 64);
	ret.Z20 := SerializedData(127 downto 96);
	ret.InvW0 := SerializedData(159 downto 128);
	ret.InvW10 := SerializedData(191 downto 160);
	ret.InvW20 := SerializedData(223 downto 192);
	
	return ret;
end function;

pure function DeserializeAttrInterpTriData(SerializedData : std_logic_vector(576-1 downto 0) ) return InterpTriData is
	variable ret : InterpTriData;
begin
	ret.TX0 := SerializedData(31 downto 0);
	ret.TX10 := SerializedData(63 downto 32);
	ret.TX20 := SerializedData(95 downto 64);
	ret.TY0 := SerializedData(127 downto 96);
	ret.TY10 := SerializedData(159 downto 128);
	ret.TY20 := SerializedData(191 downto 160);
	ret.RGBA0 := SerializedData(319 downto 192);
	ret.RGBA10 := SerializedData(447 downto 320);
	ret.RGBA20 := SerializedData(575 downto 448);
	
	return ret;
end function;

begin

	RAST_IsFull <= DINTERP_TRIDATA_FIFO_full or INTERP_TRIDATA_FIFO_full;
	DINTERP_TRIDATA_FIFO_wr_en <= RAST_PushNewTriData;
	INTERP_TRIDATA_FIFO_wr_en <= RAST_PushNewTriData;
	DINTERP_TRIDATA_FIFO_wr_data <= SerializeDInterpTriData(RAST_inBarycentricInverse,
		RAST_inZ0, RAST_inZ10, RAST_inZ20,
		RAST_inInvW0, RAST_inInvW10, RAST_inInvW20);
	INTERP_TRIDATA_FIFO_wr_data <= SerializeAttrInterpTriData(RAST_inT0X, RAST_inT10X, RAST_inT20X,
		RAST_inT0Y, RAST_inT10Y, RAST_inT20Y,
		RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);

	DINTERP_TRIDATA_FIFO_rd_en <= DINTERP_PopTriangleSlot;
	DINTERP_outBarycentricInverse <= DeserializeDInterpTriData(DINTERP_TRIDATA_FIFO_rd_data).BarycentricInverse;
	DINTERP_outZ0 <= DeserializeDInterpTriData(DINTERP_TRIDATA_FIFO_rd_data).Z0;
	DINTERP_outZ10 <= DeserializeDInterpTriData(DINTERP_TRIDATA_FIFO_rd_data).Z10;
	DINTERP_outZ20 <= DeserializeDInterpTriData(DINTERP_TRIDATA_FIFO_rd_data).Z20;
	DINTERP_outInvW0 <= DeserializeDInterpTriData(DINTERP_TRIDATA_FIFO_rd_data).InvW0;
	DINTERP_outInvW10 <= DeserializeDInterpTriData(DINTERP_TRIDATA_FIFO_rd_data).InvW10;
	DINTERP_outInvW20 <= DeserializeDInterpTriData(DINTERP_TRIDATA_FIFO_rd_data).InvW20;

	INTERP_TRIDATA_FIFO_rd_en <= INTERP_PopTriangleSlot;
	INTERP_outT0X <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).TX0;
	INTERP_outT10X <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).TX10;
	INTERP_outT20X <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).TX20;
	INTERP_outT0Y <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).TY0;
	INTERP_outT10Y <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).TY10;
	INTERP_outT20Y <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).TY20;
	INTERP_outColorRGBA0 <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).RGBA0;
	INTERP_outColorRGBA10 <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).RGBA10;
	INTERP_outColorRGBA20 <= DeserializeAttrInterpTriData(INTERP_TRIDATA_FIFO_rd_data).RGBA20;

end Behavioral;
