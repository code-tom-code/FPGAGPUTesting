#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "PixelPipelineShared.h"

union registerUnion
{
	DWORD intReg;
	float floatReg;
};
static_assert(sizeof(registerUnion) == sizeof(DWORD), "Error: Unexpected union size!");

struct VBOEntry
{
	registerUnion registers[10];
};
static_assert(sizeof(VBOEntry) == sizeof(DWORD) * 10, "Error: Unexpected struct padding!");

static std::vector<VBOEntry> VBO_FIFO;

static const unsigned short minCubeIB[36] = {
	0, 1, 2,    // side 1
    2, 1, 3,
	4, 5, 0,    // side 5
    0, 5, 1,
    4, 0, 6,    // side 2
    6, 0, 2,
    7, 5, 6,    // side 3
    6, 5, 4,
    3, 1, 7,    // side 4
    7, 1, 5,
    3, 7, 2,    // side 6
    2, 7, 6
};

// This is a batch of 15 shaded verts' data from the VBB and ShaderCore testbenches
static const DWORD drawPrimitiveTriList5Tris[] = {
0x01df01c1, // v0 oPos.x, oPos.y
0x3f74602d, // v0 oPos.z
0x00000000, // v0 oTex0.x, oTex0.y
0xc0000000, // v0 oColor.xyzw
0x013a01a1, // v1 oPos.x, oPos.y
0x3f7970d6,	// v1 oPos.z
0x00000000,	// v1 oTex0.x, oTex0.y
0xc0bb0001,	// v1 oColor.xyzw
0x00c401c3, // v2 oPos.x, oPos.y
0x3f771df5,	// v2 oPos.z
0xffff0000,	// v2 oTex0.x, oTex0.y
0xc0bbb202,	// v2 oColor.xyzw
0x011a00c4, // v3 oPos.x, oPos.y
0x3f6f3112,	// v3 oPos.z
0xffffffff,	// v3 oTex0.x, oTex0.y
0x73006a03,	// v3 oColor.xyzw
0x01df01c1, // v4 oPos.x, oPos.y
0x3f74602d,	// v4 oPos.z
0x00000000,	// v4 oTex0.x, oTex0.y
0x73000004,	// v4 oColor.xyzw
0x014e022f, // v5 oPos.x, oPos.y
0x3f6a646b,	// v5 oPos.z
0xffff0000,	// v5 oTex0.x, oTex0.y
0x73006a05,	// v5 oColor.xyzw
0x0128012a, // v6 oPos.x, oPos.y
0x3f79f770,	// v6 oPos.z
0x0000ffff,	// v6 oTex0.x, oTex0.y
0x00000006,	// v6 oColor.xyzw
0x01df01c1, // v7 oPos.x, oPos.y
0x3f74602d,	// v7 oPos.z
0x00000000,	// v7 oTex0.x, oTex0.y
0x00000007,	// v7 oColor.xyzw
0x01ac00f6, // v8 oPos.x, oPos.y
0x3f75ed21,	// v8 oPos.z
0x0000ffff,	// v8 oTex0.x, oTex0.y
0x00000008,	// v8 oColor.xyzw
0x011a00c4, // v9 oPos.x, oPos.y
0x3f6f3112,	// v9 oPos.z
0xffffffff,	// v9 oTex0.x, oTex0.y
0x73006a09,	// v9 oColor.xyzw
0x01ac00f6, // v10 oPos.x, oPos.y
0x3f75ed21,	// v10 oPos.z
0x0000ffff,	// v10 oTex0.x, oTex0.y
0x7300000a,	// v10 oColor.xyzw
0x01df01c1, // v11 oPos.x, oPos.y
0x3f74602d,	// v11 oPos.z
0x00000000,	// v11 oTex0.x, oTex0.y
0x7300000b,	// v11 oColor.xyzw
0x01df01c1, // v12 oPos.x, oPos.y
0x3f74602d,	// v12 oPos.z
0x00000000,	// v12 oTex0.x, oTex0.y
0xc000000c,	// v12 oColor.xyzw
0x00c401c3, // v13 oPos.x, oPos.y
0x3f771df5,	// v13 oPos.z
0xffff0000,	// v13 oTex0.x, oTex0.y
0xc0bbb20d,	// v13 oColor.xyzw
0x014e022f, // v14 oPos.x, oPos.y
0x3f6a646b,	// v14 oPos.z
0xffff0000,	// v14 oTex0.x, oTex0.y
0xc000b20e};// v14 oColor.xyzw

static unsigned currentIndexBufferBaseAddr = 0x00000000;

const int RunTestsInputAssembler(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

	// Clip unit interfaces begin
	std_logic_vector_port<32> CLIP_v0PosX(PD_OUT, loader, "CLIP_v0PosX");
	std_logic_vector_port<32> CLIP_v0PosY(PD_OUT, loader, "CLIP_v0PosY");
	std_logic_vector_port<32> CLIP_v0PosZ(PD_OUT, loader, "CLIP_v0PosZ");
	std_logic_vector_port<32> CLIP_v0PosW(PD_OUT, loader, "CLIP_v0PosW");
	std_logic_vector_port<32> CLIP_v1PosX(PD_OUT, loader, "CLIP_v1PosX");
	std_logic_vector_port<32> CLIP_v1PosY(PD_OUT, loader, "CLIP_v1PosY");
	std_logic_vector_port<32> CLIP_v1PosZ(PD_OUT, loader, "CLIP_v1PosZ");
	std_logic_vector_port<32> CLIP_v1PosW(PD_OUT, loader, "CLIP_v1PosW");
	std_logic_vector_port<32> CLIP_v2PosX(PD_OUT, loader, "CLIP_v2PosX");
	std_logic_vector_port<32> CLIP_v2PosY(PD_OUT, loader, "CLIP_v2PosY");
	std_logic_vector_port<32> CLIP_v2PosZ(PD_OUT, loader, "CLIP_v2PosZ");
	std_logic_vector_port<32> CLIP_v2PosW(PD_OUT, loader, "CLIP_v2PosW");
	std_logic_vector_port<32> CLIP_tex0_X(PD_OUT, loader, "CLIP_tex0_X");
	std_logic_vector_port<32> CLIP_tex0_Y(PD_OUT, loader, "CLIP_tex0_Y");
	std_logic_vector_port<32> CLIP_tex1_X(PD_OUT, loader, "CLIP_tex1_X");
	std_logic_vector_port<32> CLIP_tex1_Y(PD_OUT, loader, "CLIP_tex1_Y");
	std_logic_vector_port<32> CLIP_tex2_X(PD_OUT, loader, "CLIP_tex2_X");
	std_logic_vector_port<32> CLIP_tex2_Y(PD_OUT, loader, "CLIP_tex2_Y");
	std_logic_vector_port<128> CLIP_vertColor0_RGBA(PD_OUT, loader, "CLIP_vertColor0_RGBA");
	std_logic_vector_port<128> CLIP_vertColor1_RGBA(PD_OUT, loader, "CLIP_vertColor1_RGBA");
	std_logic_vector_port<128> CLIP_vertColor2_RGBA(PD_OUT, loader, "CLIP_vertColor2_RGBA");
	std_logic_port CLIP_readyForNewTri(PD_IN, loader, "CLIP_readyForNewTri");
	std_logic_port CLIP_newTriBegin(PD_OUT, loader, "CLIP_newTriBegin");
	// Clip unit interfaces end

	// Vertex Batch Output (VBO) interfaces begin
	std_logic_port VBO_Pushed(PD_IN, loader, "VBO_Pushed");
	std_logic_vector_port<5> VBO_NumVertices(PD_IN, loader, "VBO_NumVertices");
	std_logic_vector_port<7> VBO_NumIndices(PD_IN, loader, "VBO_NumIndices");
	std_logic_port VBO_IsIndexedDrawCall(PD_IN, loader, "VBO_IsIndexedDrawCall");
	std_logic_port VBO_Ready(PD_OUT, loader, "VBO_Ready");
	std_logic_port VERTOUT_FIFO_empty(PD_IN, loader, "VERTOUT_FIFO_empty");
	std_logic_vector_port<320> VERTOUT_FIFO_rd_data(PD_IN, loader, "VERTOUT_FIFO_rd_data");
	std_logic_port VERTOUT_FIFO_rd_en(PD_OUT, loader, "VERTOUT_FIFO_rd_en");
	std_logic_port INDEXOUT_FIFO_empty(PD_IN, loader, "INDEXOUT_FIFO_empty");
	std_logic_vector_port<256> INDEXOUT_FIFO_rd_data(PD_IN, loader, "INDEXOUT_FIFO_rd_data");
	std_logic_port INDEXOUT_FIFO_rd_en(PD_OUT, loader, "INDEXOUT_FIFO_rd_en");
	// Vertex Batch Output (VBO) interfaces end

	// Command processor interfaces begin
	std_logic_port CMD_DrawReady(PD_OUT, loader, "CMD_DrawReady");

	std_logic_port CMD_SetStateReady(PD_OUT, loader, "CMD_SetStateReady");
	std_logic_port CMD_SetStateEnable(PD_IN, loader, "CMD_SetStateEnable");
	std_logic_vector_port<2> CMD_StateCullMode(PD_IN, loader, "CMD_StateCullMode");
	std_logic_vector_port<3> CMD_StatePrimTopology(PD_IN, loader, "CMD_StatePrimTopology");

	std_logic_port CMD_IA_Idle(PD_OUT, loader, "CMD_IA_Idle"); // Signal to let the command processor know that we are idle (have no work to do)
	// Command processor interfaces end

	// Stats interface begin
	std_logic_vector_port<32> STAT_CyclesIdle(PD_OUT, loader, "STAT_CyclesIdle");
	std_logic_vector_port<32> STAT_CyclesSpentWorking(PD_OUT, loader, "STAT_CyclesSpentWorking");
	std_logic_vector_port<32> STAT_CyclesLoadingDataToCache(PD_OUT, loader, "STAT_CyclesLoadingDataToCache");
	std_logic_vector_port<32> STAT_CyclesWaitingForOutput(PD_OUT, loader, "STAT_CyclesWaitingForOutput");
	// Stats interface end

	// Debug interfaces
	std_logic_vector_port<6> DBG_IA_State(PD_OUT, loader, "DBG_IA_State");
	std_logic_vector_port<4> DBG_IA_VertexIDPerBatch(PD_OUT, loader, "DBG_IA_VertexIDPerBatch");
	std_logic_vector_port<12> DBG_IA_CurrentTriIndices(PD_OUT, loader, "DBG_IA_CurrentTriIndices");

	auto updateInterfaces = [&]()
	{
		if (VERTOUT_FIFO_rd_en.GetBoolVal() )
		{
			VBOEntry nextVBOEntry = VBO_FIFO.front();
			VBO_FIFO.erase(VBO_FIFO.begin() );
		}
		VERTOUT_FIFO_empty = VBO_FIFO.empty();

		if (!VBO_FIFO.empty() )
		{
			VERTOUT_FIFO_rd_data.SetStructVal(VBO_FIFO.front() );
		}

		if (CLIP_newTriBegin.GetBoolVal() )
		{
			const float v0posX = CLIP_v0PosX.GetFloat32Val();
			const float v0posY = CLIP_v0PosY.GetFloat32Val();
			const float v0posZ = CLIP_v0PosZ.GetFloat32Val();
			const float v0posW = CLIP_v0PosW.GetFloat32Val();
			const float v1posX = CLIP_v1PosX.GetFloat32Val();
			const float v1posY = CLIP_v1PosY.GetFloat32Val();
			const float v1posZ = CLIP_v1PosZ.GetFloat32Val();
			const float v1posW = CLIP_v1PosW.GetFloat32Val();
			const float v2posX = CLIP_v2PosX.GetFloat32Val();
			const float v2posY = CLIP_v2PosY.GetFloat32Val();
			const float v2posZ = CLIP_v2PosZ.GetFloat32Val();
			const float v2posW = CLIP_v2PosW.GetFloat32Val();

			const float v0texX = CLIP_tex0_X.GetFloat32Val();
			const float v0texY = CLIP_tex0_Y.GetFloat32Val();
			const float v1texX = CLIP_tex1_X.GetFloat32Val();
			const float v1texY = CLIP_tex1_Y.GetFloat32Val();
			const float v2texX = CLIP_tex2_X.GetFloat32Val();
			const float v2texY = CLIP_tex2_Y.GetFloat32Val();

			vertInputClipSpace::_rgba v0color;
			vertInputClipSpace::_rgba v1color;
			vertInputClipSpace::_rgba v2color;
			CLIP_vertColor0_RGBA.GetStructVal(v0color);
			CLIP_vertColor1_RGBA.GetStructVal(v1color);
			CLIP_vertColor2_RGBA.GetStructVal(v2color);

			printf("New triangle.\n\tv0 = { pos = (%f,%f,%f,%f), tex = (%f,%f); col = (%f,%f,%f,%f) }\n\tv1 = { pos = (%f,%f,%f,%f), tex = (%f,%f); col = (%f,%f,%f,%f) }\n\tv2 = { pos = (%f,%f,%f,%f), tex = (%f,%f); col = (%f,%f,%f,%f) }\n",
				v0posX, v0posY, v0posZ, v0posW, v0texX, v0texY, v0color.r, v0color.g, v0color.b, v0color.a,
				v1posX, v1posY, v1posZ, v1posW, v1texX, v1texY, v1color.r, v1color.g, v1color.b, v1color.a,
				v2posX, v2posY, v2posZ, v2posW, v2texX, v2texY, v2color.r, v2color.g, v2color.b, v2color.a);
		}
	};

	// Start up idling with default values for a hundred cycles:
	VBO_Pushed = false;
	CLIP_readyForNewTri = false;
	VBO_NumVertices = 0;
	VBO_NumIndices = 0;
	VBO_IsIndexedDrawCall = false;
	VERTOUT_FIFO_empty = true;
	VERTOUT_FIFO_rd_data.SetToZero();
	INDEXOUT_FIFO_empty = true;
	INDEXOUT_FIFO_rd_data.SetToZero();
	CMD_SetStateEnable = false;
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		updateInterfaces();
	}

	for (unsigned x = 0; x < ARRAYSIZE(drawPrimitiveTriList5Tris) / 4; ++x)
	{
		VBOEntry newEntry;
		newEntry.registers[0].intReg = drawPrimitiveTriList5Tris[x * 4 + 0];
		newEntry.registers[1].intReg = drawPrimitiveTriList5Tris[x * 4 + 1];
		newEntry.registers[2].intReg = drawPrimitiveTriList5Tris[x * 4 + 2];
		newEntry.registers[3].intReg = drawPrimitiveTriList5Tris[x * 4 + 3];
		VBO_FIFO.push_back(newEntry);
	}

	if (!VBO_Ready.GetBoolVal() )
	{
		__debugbreak();
	}

	if (!CMD_SetStateReady.GetBoolVal() )
	{
		__debugbreak();
	}

	{
		scoped_timestep time(loader, clk, 100);
		CMD_SetStateEnable = true;
		CMD_StateCullMode = 0; // Cull CCW
		CMD_StatePrimTopology = 3; // Triangle list
		currentIndexBufferBaseAddr = reinterpret_cast<unsigned>(&minCubeIB);
		updateInterfaces();
	}
	CMD_SetStateEnable = false;

	CLIP_readyForNewTri = true;

	{
		scoped_timestep time(loader, clk, 100);
		VBO_Pushed = true;
		updateInterfaces();
	}
	{
		scoped_timestep time(loader, clk, 100);
		VBO_Pushed = false;
		updateInterfaces();
	}

	unsigned IAState = 0;

	// Load vertex data from the vertex batch:
	do
	{
		scoped_timestep time(loader, clk, 100);
		updateInterfaces();
		IAState = DBG_IA_State.GetUint8Val();
	} while (IAState == 3);

	// Push vertex data into triangle setup:
	do
	{
		scoped_timestep time(loader, clk, 100);
		updateInterfaces();
		IAState = DBG_IA_State.GetUint8Val();
	} while (IAState != 0);

	printf("Indexed tri test:\n");

	for (unsigned x = 0; x < ARRAYSIZE(drawPrimitiveTriList5Tris) / 4; ++x)
	{
		VBOEntry newEntry;
		newEntry.registers[0].intReg = drawPrimitiveTriList5Tris[x * 4 + 0];
		newEntry.registers[1].intReg = drawPrimitiveTriList5Tris[x * 4 + 1];
		newEntry.registers[2].intReg = drawPrimitiveTriList5Tris[x * 4 + 2];
		newEntry.registers[3].intReg = drawPrimitiveTriList5Tris[x * 4 + 3];
		VBO_FIFO.push_back(newEntry);
	}

	{
		scoped_timestep time(loader, clk, 100);
		VBO_Pushed = true;
		updateInterfaces();
	}

	// Push vertex data into triangle setup:
	do
	{
		scoped_timestep time(loader, clk, 100);
		updateInterfaces();
		IAState = DBG_IA_State.GetUint8Val();
	} while (IAState != 0);

	IAState = DBG_IA_State.GetUint8Val();
	
	return S_OK;
}