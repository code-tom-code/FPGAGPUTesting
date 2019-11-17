library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
library IEEE;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.IndexBufferData.all;

library work;
use work.VertexBufferData.all;

entity VertexDataSource is
  Port (clk : in STD_LOGIC;
        v0PosX0 : out STD_LOGIC_VECTOR(10 downto 0);
        v0PosY0 : out STD_LOGIC_VECTOR(10 downto 0);
        v0PosInvZ0 : out STD_LOGIC_VECTOR(23 downto 0);
        v1PosX0 : out STD_LOGIC_VECTOR(10 downto 0);
        v1PosY0 : out STD_LOGIC_VECTOR(10 downto 0);
        v1PosInvZ0 : out STD_LOGIC_VECTOR(23 downto 0);
        v2PosX0 : out STD_LOGIC_VECTOR(10 downto 0);
        v2PosY0 : out STD_LOGIC_VECTOR(10 downto 0);
        v2PosInvZ0 : out STD_LOGIC_VECTOR(23 downto 0);
        tex0_X0 : out STD_LOGIC_VECTOR(15 downto 0);
        tex0_Y0 : out STD_LOGIC_VECTOR(15 downto 0);
        tex1_X0 : out STD_LOGIC_VECTOR(15 downto 0);
        tex1_Y0 : out STD_LOGIC_VECTOR(15 downto 0);
        tex2_X0 : out STD_LOGIC_VECTOR(15 downto 0);
        tex2_Y0 : out STD_LOGIC_VECTOR(15 downto 0);
        --triColorR0 : out STD_LOGIC_VECTOR(7 downto 0); TODO: Replace with vertex color
        --triColorG0 : out STD_LOGIC_VECTOR(7 downto 0);
        --triColorB0 : out STD_LOGIC_VECTOR(7 downto 0);
        readyForNewTri0 : in STD_LOGIC;
        newTriBegin0 : out STD_LOGIC;
        v0PosX1 : out STD_LOGIC_VECTOR(10 downto 0);
        v0PosY1 : out STD_LOGIC_VECTOR(10 downto 0);
        v0PosInvZ1 : out STD_LOGIC_VECTOR(23 downto 0);
        v1PosX1 : out STD_LOGIC_VECTOR(10 downto 0);
        v1PosY1 : out STD_LOGIC_VECTOR(10 downto 0);
        v1PosInvZ1 : out STD_LOGIC_VECTOR(23 downto 0);
        v2PosX1 : out STD_LOGIC_VECTOR(10 downto 0);
        v2PosY1 : out STD_LOGIC_VECTOR(10 downto 0);
        v2PosInvZ1 : out STD_LOGIC_VECTOR(23 downto 0);
        tex0_X1 : out STD_LOGIC_VECTOR(15 downto 0);
        tex0_Y1 : out STD_LOGIC_VECTOR(15 downto 0);
        tex1_X1 : out STD_LOGIC_VECTOR(15 downto 0);
        tex1_Y1 : out STD_LOGIC_VECTOR(15 downto 0);
        tex2_X1 : out STD_LOGIC_VECTOR(15 downto 0);
        tex2_Y1 : out STD_LOGIC_VECTOR(15 downto 0);
        --triColorR1 : out STD_LOGIC_VECTOR(7 downto 0); TODO: Replace with vertex color
        --triColorG1 : out STD_LOGIC_VECTOR(7 downto 0);
        --triColorB1 : out STD_LOGIC_VECTOR(7 downto 0);
        readyForNewTri1 : in STD_LOGIC;
        newTriBegin1 : out STD_LOGIC;
        thisFrameTXOffset : out STD_LOGIC_VECTOR(15 downto 0);
        clearRectLeft : out STD_LOGIC_VECTOR(9 downto 0);
        clearRectRight : out STD_LOGIC_VECTOR(9 downto 0);
        clearRectTop : out STD_LOGIC_VECTOR(9 downto 0);
        clearRectBottom : out STD_LOGIC_VECTOR(9 downto 0);
        clearColorR : out STD_LOGIC_VECTOR(7 downto 0);
        clearColorG : out STD_LOGIC_VECTOR(7 downto 0);
        clearColorB : out STD_LOGIC_VECTOR(7 downto 0);
        clearRequestBegin : out STD_LOGIC;
        clearComplete : in STD_LOGIC);
end VertexDataSource;

architecture Behavioral of VertexDataSource is

attribute ROM_STYLE : string;

signal index_buffer_rom : index_buffer_bits_t := index_buffer_rom_data;
attribute ROM_STYLE of index_buffer_rom: signal is "BLOCK";

signal vertex_x_buffer_rom : vertex_buffer_posbits_t := vertex_x_buffer_rom_data; 
attribute ROM_STYLE of vertex_x_buffer_rom: signal is "BLOCK";

signal vertex_y_buffer_rom : vertex_buffer_posbits_t := vertex_y_buffer_rom_data;     
attribute ROM_STYLE of vertex_y_buffer_rom: signal is "BLOCK";               

signal vertex_invz_buffer_rom : vertex_buffer_invzbits_t := vertex_invz_buffer_rom_data;
attribute ROM_STYLE of vertex_invz_buffer_rom: signal is "BLOCK";

signal vertex_tx_buffer_rom : vertex_buffer_texbits_t := vertex_tx_buffer_rom_data;
attribute ROM_STYLE of vertex_tx_buffer_rom: signal is "BLOCK";

signal vertex_ty_buffer_rom : vertex_buffer_texbits_t := vertex_ty_buffer_rom_data;
attribute ROM_STYLE of vertex_ty_buffer_rom: signal is "BLOCK";

signal currentIndexA : unsigned(10 downto 0) := "00000000000";
signal currentIndexB : unsigned(10 downto 0) := "00000000001";
signal currentIndexC : unsigned(10 downto 0) := "00000000010";

signal currentIndexValA : unsigned(7 downto 0) := "00000000";
signal currentIndexValB : unsigned(7 downto 0) := "00000000";
signal currentIndexValC : unsigned(7 downto 0) := "00000000";

signal currentTXOffset : unsigned(15 downto 0) := "0000000000000000";

type state_t is (
    vertDataSource_waitForTriReady,
    sendTriData,
    advanceIndices,
    readIndicesA,
    readIndicesB,
    readIndicesC,
    degenerateTriangleSkipCheck,
    readVertsA,
    readVertsB,
    readVertsC,
    doneState,
    startClearState,
    waitForClearState);
    
type vertexPos is record
    vx : unsigned(9 downto 0);
    vy : unsigned(9 downto 0);
    vInvZ : unsigned(23 downto 0);
end record vertexPos;

type vertexTexcoord is record
    tx : unsigned(15 downto 0);
    ty : unsigned(15 downto 0);
end record vertexTexcoord;
    
type vertexData is record
    pos : vertexPos;
    texcoord : vertexTexcoord;
end record vertexData;

type triangleData is record
    v0 : vertexData;
    v1 : vertexData;
    v2 : vertexData;
end record triangleData;
    
signal currentState : state_t := readIndicesA;

-- One current triangle for each of the IA pipelines
signal currentTri0 : triangleData;
signal currentTri1 : triangleData;

signal currentV0_X : unsigned(9 downto 0) := (others => '0');
signal currentV0_Y : unsigned(9 downto 0) := (others => '0');
signal currentV0_InvZ : unsigned(23 downto 0) := (others => '0');
signal currentV1_X : unsigned(9 downto 0) := (others => '0');
signal currentV1_Y : unsigned(9 downto 0) := (others => '0');
signal currentV1_InvZ : unsigned(23 downto 0) := (others => '0');
signal currentV2_X : unsigned(9 downto 0) := (others => '0');
signal currentV2_Y : unsigned(9 downto 0) := (others => '0');
signal currentV2_InvZ : unsigned(23 downto 0) := (others => '0');
signal currentTex0_X : unsigned(15 downto 0) := (others => '0');
signal currentTex0_Y : unsigned(15 downto 0) := (others => '0');
signal currentTex1_X : unsigned(15 downto 0) := (others => '0');
signal currentTex1_Y : unsigned(15 downto 0) := (others => '0');
signal currentTex2_X : unsigned(15 downto 0) := (others => '0');
signal currentTex2_Y : unsigned(15 downto 0) := (others => '0');

signal stats_totalTrianglesDegenerateIndexCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesPassed : unsigned(11 downto 0) := (others => '0');

-- Primitive number that resets to 0 at the start of each Draw() call
signal SV_PrimitiveID : unsigned(31 downto 0) := (others => '0');

begin

    process(clk)   
    begin
        if (rising_edge(clk) ) then
            thisFrameTXOffset <= std_logic_vector(currentTXOffset);
            case currentState is
                when vertDataSource_waitForTriReady =>
                    if (readyForNewTri0 = '0') then
                        currentState <= vertDataSource_waitForTriReady;
                    else
                        currentState <= sendTriData;
                    end if;
                when sendTriData =>
                    v0PosX0 <= '0' & std_logic_vector(currentTri0.v0.pos.vx);
                    v0PosY0 <= '0' & std_logic_vector(currentTri0.v0.pos.vy);
                    v0PosInvZ0 <= std_logic_vector(currentTri0.v0.pos.vInvZ);
                    v1PosX0 <= '0' & std_logic_vector(currentTri0.v1.pos.vx);
                    v1PosY0 <= '0' & std_logic_vector(currentTri0.v1.pos.vy);
                    v1PosInvZ0 <= std_logic_vector(currentTri0.v1.pos.vInvZ);
                    v2PosX0 <= '0' & std_logic_vector(currentTri0.v2.pos.vx);
                    v2PosY0 <= '0' & std_logic_vector(currentTri0.v2.pos.vy);
                    v2PosInvZ0 <= std_logic_vector(currentTri0.v2.pos.vInvZ);
                    
                    tex0_X0 <= std_logic_vector(currentTri0.v0.texcoord.tx);
                    tex0_Y0 <= std_logic_vector(currentTri0.v0.texcoord.ty);
                    tex1_X0 <= std_logic_vector(currentTri0.v1.texcoord.tx);
                    tex1_Y0 <= std_logic_vector(currentTri0.v1.texcoord.ty);
                    tex2_X0 <= std_logic_vector(currentTri0.v2.texcoord.tx);
                    tex2_Y0 <= std_logic_vector(currentTri0.v2.texcoord.ty);
                    --triColorR0 <= std_logic_vector(currentIndexValA);
                    --triColorG0 <= std_logic_vector(currentIndexValB);
                    --triColorB0 <= std_logic_vector(currentIndexValC);
                    
                    stats_totalTrianglesPassed <= stats_totalTrianglesPassed + 1;
                    
                    newTriBegin0 <= '1';
                    
                    currentState <= advanceIndices;
                when advanceIndices =>
                    SV_PrimitiveID <= SV_PrimitiveID + 1;
                    
                    if (currentIndexA < to_unsigned(1350, 11) ) then
                    --if (currentIndexA < to_unsigned(6, 11) ) then
                        currentIndexA <= currentIndexA + 3;
                        currentIndexB <= currentIndexB + 3;
                        currentIndexC <= currentIndexC + 3;
                        currentState <= readIndicesA;
                    else
                        currentState <= doneState;
                    end if;
                when readIndicesA =>
                    currentIndexValA <= index_buffer_rom(to_integer(currentIndexA) );
                    currentState <= readIndicesB;
                when readIndicesB =>
                    currentIndexValB <= index_buffer_rom(to_integer(currentIndexB) );
                    currentState <= readIndicesC;
                when readIndicesC =>
                    currentIndexValC <= index_buffer_rom(to_integer(currentIndexC) );
                    currentState <= degenerateTriangleSkipCheck;
                when degenerateTriangleSkipCheck =>
                    if ( (currentIndexValA = currentIndexValB) or
                        (currentIndexValA = currentIndexValC) or
                        (currentIndexValB = currentIndexValC) ) then
                        stats_totalTrianglesDegenerateIndexCulled <= stats_totalTrianglesDegenerateIndexCulled + 1;
                        currentState <= advanceIndices; -- Skip reading the vertex buffer if this triangle's indices are the same
                    else
                        currentState <= readVertsA;
                    end if;
                when readVertsA =>
                    currentTri0.v0.pos.vx <= vertex_x_buffer_rom(to_integer(currentIndexValA) );
                    currentTri0.v0.pos.vy <= vertex_y_buffer_rom(to_integer(currentIndexValA) );
                    currentTri0.v0.pos.vInvZ <= vertex_invz_buffer_rom(to_integer(currentIndexValA) );
                    currentTri0.v0.texcoord.tx <= vertex_tx_buffer_rom(to_integer(currentIndexValA) );
                    currentTri0.v0.texcoord.ty <= vertex_ty_buffer_rom(to_integer(currentIndexValA) );
                    currentState <= readVertsB;
                when readVertsB =>
                    currentTri0.v1.pos.vx <= vertex_x_buffer_rom(to_integer(currentIndexValB) );
                    currentTri0.v1.pos.vy <= vertex_y_buffer_rom(to_integer(currentIndexValB) );
                    currentTri0.v1.pos.vInvZ <= vertex_invz_buffer_rom(to_integer(currentIndexValB) );
                    currentTri0.v1.texcoord.tx <= vertex_tx_buffer_rom(to_integer(currentIndexValB) );
                    currentTri0.v1.texcoord.ty <= vertex_ty_buffer_rom(to_integer(currentIndexValB) );
                    currentState <= readVertsC;
                when readVertsC =>
                    currentTri0.v2.pos.vx <= vertex_x_buffer_rom(to_integer(currentIndexValC) );
                    currentTri0.v2.pos.vy <= vertex_y_buffer_rom(to_integer(currentIndexValC) );
                    currentTri0.v2.pos.vInvZ <= vertex_invz_buffer_rom(to_integer(currentIndexValC) );
                    currentTri0.v2.texcoord.tx <= vertex_tx_buffer_rom(to_integer(currentIndexValC) );
                    currentTri0.v2.texcoord.ty <= vertex_ty_buffer_rom(to_integer(currentIndexValC) );
                    currentState <= vertDataSource_waitForTriReady;
                when doneState =>
                    currentIndexA <= "00000000000";
                    currentIndexB <= "00000000001";
                    currentIndexC <= "00000000010";
                    currentTXOffset <= currentTXOffset + 32;
                    currentState <= startClearState; -- Reset to the beginning and start all over again!
                    -- currentState <= doneState; -- Stay in this state forever and do nothing!
                when startClearState =>
                    if (clearComplete = '1') then
                        clearRectLeft <= (others => '0');
                        clearRectTop <= (others => '0');
                        clearRectRight <= std_logic_vector(to_unsigned(640, 10) );
                        clearRectBottom <= std_logic_vector(to_unsigned(480, 10) );
                        clearColorR <= std_logic_vector(currentTXOffset(7 downto 0) );
                        clearColorG <= std_logic_vector(currentTXOffset(15 downto 8) );
                        clearColorB <= x"00";
                        clearRequestBegin <= '1';
                        currentState <= waitForClearState;
                    end if;
                when waitForClearState =>
                    clearRequestBegin <= '0';
                    if (clearComplete = '1') then
                        currentState <= readIndicesA;
                    end if;
            end case;
            
            if (readyForNewTri1 = '1') then
                v0PosX1 <= std_logic_vector(to_unsigned(0, 11) );
                v0PosY1 <= std_logic_vector(to_unsigned(125, 11) );
                v0PosInvZ1 <= std_logic_vector(to_unsigned(8388608, 24) );
                v1PosX1 <= std_logic_vector(to_unsigned(25, 11) );
                v1PosY1 <= std_logic_vector(to_unsigned(25, 11) );
                v1PosInvZ1 <= std_logic_vector(to_unsigned(8388608, 24) );
                v2PosX1 <= std_logic_vector(to_unsigned(50, 11) );
                v2PosY1 <= std_logic_vector(to_unsigned(125, 11) );
                v2PosInvZ1 <= std_logic_vector(to_unsigned(8388608, 24) );
                tex0_X1 <= x"0000";
                tex0_Y1 <= x"0000";
                tex1_X1 <= x"8000";
                tex1_Y1 <= x"FFFF"; 
                tex2_X1 <= x"FFFF";
                tex2_Y1 <= x"0000";
                --triColorR1 <= "11111111";
                --triColorG1 <= "00000000";
                --triColorB1 <= "11111111";
                
                newTriBegin1 <= '1';
            else
                newTriBegin1 <= '0';
            end if;
        end if;
    end process;

end Behavioral;
