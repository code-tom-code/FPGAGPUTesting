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

			INTERP_outInvZ0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outInvZ1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outInvZ2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outT0X : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
			INTERP_outT0Y : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
			INTERP_outT1X : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
			INTERP_outT1Y : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
			INTERP_outT2X : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
			INTERP_outT2Y : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
			INTERP_outColorRGBA0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outColorRGBA1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
			INTERP_outColorRGBA2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

			INTERP_CurrentSlotIndex : in STD_LOGIC_VECTOR(2 downto 0);
			INTERP_SignalSlotComplete : in STD_LOGIC;
		-- TriWorkCache per-triangle interface end

		-- Rasterizer interface begin
			RAST_inBarycentricInverse : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inPrimitiveID : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inDrawCallID : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inVFACE : in STD_LOGIC;

			RAST_inInvZ0 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inInvZ1 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inInvZ2 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inT0X : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inT0Y : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inT1X : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inT1Y : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inT2X : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inT2Y : in STD_LOGIC_VECTOR(15 downto 0);
			RAST_inColorRGBA0 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inColorRGBA1 : in STD_LOGIC_VECTOR(31 downto 0);
			RAST_inColorRGBA2 : in STD_LOGIC_VECTOR(31 downto 0);

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
	InvZ : STD_LOGIC_VECTOR(31 downto 0);
	TX : STD_LOGIC_VECTOR(15 downto 0);
	TY : STD_LOGIC_VECTOR(15 downto 0);
	ColorRGBA : STD_LOGIC_VECTOR(31 downto 0);
end record triWorkVertexData;

type triWorkCacheEntry is record

	-- Per-polygon data here:
	BarycentricInverse : STD_LOGIC_VECTOR(31 downto 0);
	PrimitiveID : STD_LOGIC_VECTOR(15 downto 0);
	DrawCallID : STD_LOGIC_VECTOR(15 downto 0);
	VFACE : STD_LOGIC;

	-- Per-vertex data here:
	VertexA : triWorkVertexData;
	VertexB : triWorkVertexData;
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

	signal inInvZ0 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inInvZ1 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inInvZ2 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inT0X : in STD_LOGIC_VECTOR(15 downto 0);
	signal inT0Y : in STD_LOGIC_VECTOR(15 downto 0);
	signal inT1X : in STD_LOGIC_VECTOR(15 downto 0);
	signal inT1Y : in STD_LOGIC_VECTOR(15 downto 0);
	signal inT2X : in STD_LOGIC_VECTOR(15 downto 0);
	signal inT2Y : in STD_LOGIC_VECTOR(15 downto 0);
	signal inColorRGBA0 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inColorRGBA1 : in STD_LOGIC_VECTOR(31 downto 0);
	signal inColorRGBA2 : in STD_LOGIC_VECTOR(31 downto 0)
	) is
begin
	cacheEntry.BarycentricInverse <= inBarycentricInverse;
	cacheEntry.PrimitiveID <= inPrimitiveID;
	cacheEntry.DrawCallID <= inDrawCallID;
	cacheEntry.VFACE <= '1';

	cacheEntry.VertexA.InvZ <= inInvZ0;
	cacheEntry.VertexB.InvZ <= inInvZ1;
	cacheEntry.VertexC.InvZ <= inInvZ2;

	cacheEntry.VertexA.TX <= inT0X;
	cacheEntry.VertexA.TY <= inT0Y;
	cacheEntry.VertexB.TX <= inT1X;
	cacheEntry.VertexB.TY <= inT1Y;
	cacheEntry.VertexC.TX <= inT2X;
	cacheEntry.VertexC.TY <= inT2Y;

	cacheEntry.VertexA.ColorRGBA <= inColorRGBA0;
	cacheEntry.VertexB.ColorRGBA <= inColorRGBA1;
	cacheEntry.VertexC.ColorRGBA <= inColorRGBA2;
end procedure;

begin

DBG_NumActiveTriangles <= std_logic_vector(GetActiveTriangleCount(slotsInUse) );

INTERP_outBarycentricInverse <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).BarycentricInverse;
INTERP_outPrimitiveID <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).PrimitiveID;
INTERP_outDrawCallID <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).DrawCallID;
INTERP_outVFACE <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VFACE;

INTERP_outInvZ0 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.InvZ;
INTERP_outInvZ1 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.InvZ;
INTERP_outInvZ2 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.InvZ;
INTERP_outT0X <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.TX;
INTERP_outT0Y <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.TY;
INTERP_outT1X <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.TX;
INTERP_outT1Y <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.TY;
INTERP_outT2X <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.TX;
INTERP_outT2Y <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.TY;
INTERP_outColorRGBA0 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexA.ColorRGBA;
INTERP_outColorRGBA1 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexB.ColorRGBA;
INTERP_outColorRGBA2 <= triWorkCacheEntries(to_integer(unsigned(INTERP_CurrentSlotIndex) ) ).VertexC.ColorRGBA;

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
						RAST_inInvZ0, RAST_inInvZ1, RAST_inInvZ2, RAST_inT0X, RAST_inT0Y, RAST_inT1X, RAST_inT1Y, RAST_inT2X, RAST_inT2Y, RAST_inColorRGBA0, RAST_inColorRGBA1, RAST_inColorRGBA2);
					RAST_NewTriSlotIndex <= "000";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(1) = '0') then
					slotsInUse(1) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(1), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inInvZ0, RAST_inInvZ1, RAST_inInvZ2, RAST_inT0X, RAST_inT0Y, RAST_inT1X, RAST_inT1Y, RAST_inT2X, RAST_inT2Y, RAST_inColorRGBA0, RAST_inColorRGBA1, RAST_inColorRGBA2);
					RAST_NewTriSlotIndex <= "001";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(2) = '0') then
					slotsInUse(2) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(2), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inInvZ0, RAST_inInvZ1, RAST_inInvZ2, RAST_inT0X, RAST_inT0Y, RAST_inT1X, RAST_inT1Y, RAST_inT2X, RAST_inT2Y, RAST_inColorRGBA0, RAST_inColorRGBA1, RAST_inColorRGBA2);
					RAST_NewTriSlotIndex <= "010";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(3) = '0') then
					slotsInUse(3) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(3), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inInvZ0, RAST_inInvZ1, RAST_inInvZ2, RAST_inT0X, RAST_inT0Y, RAST_inT1X, RAST_inT1Y, RAST_inT2X, RAST_inT2Y, RAST_inColorRGBA0, RAST_inColorRGBA1, RAST_inColorRGBA2);
					RAST_NewTriSlotIndex <= "011";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(4) = '0') then
					slotsInUse(4) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(4), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inInvZ0, RAST_inInvZ1, RAST_inInvZ2, RAST_inT0X, RAST_inT0Y, RAST_inT1X, RAST_inT1Y, RAST_inT2X, RAST_inT2Y, RAST_inColorRGBA0, RAST_inColorRGBA1, RAST_inColorRGBA2);
					RAST_NewTriSlotIndex <= "100";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(5) = '0') then
					slotsInUse(5) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(5), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inInvZ0, RAST_inInvZ1, RAST_inInvZ2, RAST_inT0X, RAST_inT0Y, RAST_inT1X, RAST_inT1Y, RAST_inT2X, RAST_inT2Y, RAST_inColorRGBA0, RAST_inColorRGBA1, RAST_inColorRGBA2);
					RAST_NewTriSlotIndex <= "101";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(6) = '0') then
					slotsInUse(6) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(6), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inInvZ0, RAST_inInvZ1, RAST_inInvZ2, RAST_inT0X, RAST_inT0Y, RAST_inT1X, RAST_inT1Y, RAST_inT2X, RAST_inT2Y, RAST_inColorRGBA0, RAST_inColorRGBA1, RAST_inColorRGBA2);
					RAST_NewTriSlotIndex <= "110";
					RAST_NewTriSlotIndexValid <= '1';
				elsif (slotsInUse(7) = '0') then
					slotsInUse(7) <= '1';
					LoadTriDataIntoSlot(triWorkCacheEntries(7), RAST_inBarycentricInverse, RAST_inPrimitiveID, RAST_inDrawCallID, RAST_inVFACE,
						RAST_inInvZ0, RAST_inInvZ1, RAST_inInvZ2, RAST_inT0X, RAST_inT0Y, RAST_inT1X, RAST_inT1Y, RAST_inT2X, RAST_inT2Y, RAST_inColorRGBA0, RAST_inColorRGBA1, RAST_inColorRGBA2);
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
