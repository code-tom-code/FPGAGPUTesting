library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TriWorkCache is
		Port ( clk : in STD_LOGIC;

		-- TriWorkCache per-triangle interface begin
			INTERP_outBarycentricInverse : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outPrimitiveID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
			INTERP_outDrawCallID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
			INTERP_outVFACE : out STD_LOGIC := '0';

			INTERP_outZ0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outZ10 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outZ20 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outInvW0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outInvW10 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outInvW20 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT0X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT0Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT10X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT10Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT20X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT20Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outColorRGBA0 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
			INTERP_outColorRGBA10 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
			INTERP_outColorRGBA20 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');

			INTERP_CurrentSlotIndex : in STD_LOGIC_VECTOR(2 downto 0);
			INTERP_SignalSlotComplete : in STD_LOGIC;
		-- TriWorkCache per-triangle interface end

		-- Rasterizer interface begin
			RAST_inBarycentricInverse : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inPrimitiveID : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inDrawCallID : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inVFACE : in STD_LOGIC;

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

			RAST_RequestNewTriSlot : in STD_LOGIC;
			RAST_NewTriSlotIndexValid : out STD_LOGIC := '0';
			RAST_NewTriSlotIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		-- Rasterizer interface end

		-- Debug signals
			DBG_NumActiveTriangles : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0')
			);
end TriWorkCache;

architecture Behavioral of TriWorkCache is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

pure function GetActiveTriangleCount(activeSlotsBitmask : STD_LOGIC_VECTOR(7 downto 0) ) return unsigned is
	variable numActiveSlots : unsigned(3 downto 0);
begin
	numActiveSlots := (others => '0');
	for i in 0 to 7 loop
		if (activeSlotsBitmask(i) = '1') then
			numActiveSlots := numActiveSlots + 1;
		end if;
	end loop;
	return numActiveSlots;
end function;

signal slotsInUse : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

type triWorkVertexData is record
	Z : STD_LOGIC_VECTOR(31 downto 0);
	InvW : STD_LOGIC_VECTOR(31 downto 0);
	TX : STD_LOGIC_VECTOR(31 downto 0);
	TY : STD_LOGIC_VECTOR(31 downto 0);
	ColorRGBA : STD_LOGIC_VECTOR(127 downto 0);
end record triWorkVertexData;

type triWorkCacheEntry is record

	-- Per-polygon data here:
	BarycentricInverse : STD_LOGIC_VECTOR(31 downto 0);
	PrimitiveID : STD_LOGIC_VECTOR(15 downto 0);
	DrawCallID : STD_LOGIC_VECTOR(15 downto 0);
	VFACE : STD_LOGIC;

	-- Per-vertex data here:
	VertexA : triWorkVertexData; -- Vertex A is the base vertex
	VertexB : triWorkVertexData; -- Vertices B and C are delta vertices (v1 - v0) and (v2 - v0) respectively
	VertexC : triWorkVertexData;
end record triWorkCacheEntry;

type triWorkCacheArray is array(7 downto 0) of triWorkCacheEntry;
signal triWorkCacheEntries : triWorkCacheArray;

procedure LoadTriDataIntoSlot(
	signal cacheEntry : out triWorkCacheEntry;

	signal inBarycentricInverse : in STD_LOGIC_VECTOR(31 downto 0);
	signal inPrimitiveID : in STD_LOGIC_VECTOR(15 downto 0);
	signal inDrawCallID : in STD_LOGIC_VECTOR(15 downto 0);
	signal inVFACE : in STD_LOGIC;

	signal inZ0 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inZ10 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inZ20 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inInvW0 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inInvW10 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inInvW20 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inT0X : in STD_LOGIC_VECTOR(31 downto 0);
	signal inT0Y : in STD_LOGIC_VECTOR(31 downto 0);
	signal inT10X : in STD_LOGIC_VECTOR(31 downto 0);
	signal inT10Y : in STD_LOGIC_VECTOR(31 downto 0);
	signal inT20X : in STD_LOGIC_VECTOR(31 downto 0);
	signal inT20Y : in STD_LOGIC_VECTOR(31 downto 0);
	signal inColorRGBA0 : in STD_LOGIC_VECTOR(127 downto 0);
	signal inColorRGBA10 : in STD_LOGIC_VECTOR(127 downto 0);
	signal inColorRGBA20 : in STD_LOGIC_VECTOR(127 downto 0)
	) is
begin
	cacheEntry.BarycentricInverse <= inBarycentricInverse;
	cacheEntry.PrimitiveID <= inPrimitiveID;
	cacheEntry.DrawCallID <= inDrawCallID;
	cacheEntry.VFACE <= '1';

	cacheEntry.VertexA.Z <= inZ0;
	cacheEntry.VertexB.Z <= inZ10;
	cacheEntry.VertexC.Z <= inZ20;

	cacheEntry.VertexA.InvW <= inInvW0;
	cacheEntry.VertexB.InvW <= inInvW10;
	cacheEntry.VertexC.InvW <= inInvW20;

	cacheEntry.VertexA.TX <= inT0X;
	cacheEntry.VertexA.TY <= inT0Y;
	cacheEntry.VertexB.TX <= inT10X;
	cacheEntry.VertexB.TY <= inT10Y;
	cacheEntry.VertexC.TX <= inT20X;
	cacheEntry.VertexC.TY <= inT20Y;

	cacheEntry.VertexA.ColorRGBA <= inColorRGBA0;
	cacheEntry.VertexB.ColorRGBA <= inColorRGBA10;
	cacheEntry.VertexC.ColorRGBA <= inColorRGBA20;
end procedure;

begin

DBG_NumActiveTriangles <= std_logic_vector(GetActiveTriangleCount(slotsInUse) );

INTERP_outBarycentricInverse <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).BarycentricInverse;
INTERP_outPrimitiveID <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).PrimitiveID;
INTERP_outDrawCallID <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).DrawCallID;
INTERP_outVFACE <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VFACE;

INTERP_outZ0 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.Z;
INTERP_outZ10 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.Z;
INTERP_outZ20 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.Z;
INTERP_outInvW0 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.InvW;
INTERP_outInvW10 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.InvW;
INTERP_outInvW20 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.InvW;
INTERP_outT0X <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.TX;
INTERP_outT0Y <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.TY;
INTERP_outT10X <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.TX;
INTERP_outT10Y <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.TY;
INTERP_outT20X <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.TX;
INTERP_outT20Y <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.TY;
INTERP_outColorRGBA0 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.ColorRGBA;
INTERP_outColorRGBA10 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.ColorRGBA;
INTERP_outColorRGBA20 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.ColorRGBA;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			if (INTERP_SignalSlotComplete = '1') then
				RAST_NewTriSlotIndex <= (others => '0');
				slotsInUse(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ) <= '0';
				RAST_NewTriSlotIndexValid <= '0';
			elsif (RAST_RequestNewTriSlot = '1') then
				if (slotsInUse(0) = '0') then
					slotsInUse(0) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(0), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);
					RAST_NewTriSlotIndex <= "000";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(1) = '0') then
					slotsInUse(1) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(1), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);
					RAST_NewTriSlotIndex <= "001";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(2) = '0') then
					slotsInUse(2) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(2), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);
					RAST_NewTriSlotIndex <= "010";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(3) = '0') then
					slotsInUse(3) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(3), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);
					RAST_NewTriSlotIndex <= "011";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(4) = '0') then
					slotsInUse(4) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(4), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);
					RAST_NewTriSlotIndex <= "100";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(5) = '0') then
					slotsInUse(5) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(5), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);
					RAST_NewTriSlotIndex <= "101";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(6) = '0') then
					slotsInUse(6) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(6), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);
					RAST_NewTriSlotIndex <= "110";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(7) = '0') then
					slotsInUse(7) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(7), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20);
					RAST_NewTriSlotIndex <= "111";
					RAST_NewTriSlotIndexValid <= '1';
				else
					RAST_NewTriSlotIndex <= (others => '0');
					RAST_NewTriSlotIndexValid <= '0';
				end if;
			else
				RAST_NewTriSlotIndex <= (others => '0');
				RAST_NewTriSlotIndexValid <= '0';
			end if;
		end if;
	end process;

end Behavioral;
