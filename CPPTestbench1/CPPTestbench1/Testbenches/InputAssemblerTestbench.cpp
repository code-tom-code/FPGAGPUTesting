#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"

union registerUnion
{
	DWORD intReg;
	float floatReg;
	struct
	{
		unsigned short texX;
		unsigned short texY;
	} packedTexcoordReg;
	struct
	{
		signed short posX;
		signed short posY;
	} packedPosReg;
	struct
	{
		unsigned char r;
		unsigned char g;
		unsigned char b;
		unsigned char a;
	} packedColorsReg;
};
static_assert(sizeof(registerUnion) == sizeof(DWORD), "Error: Unexpected union size!");

struct VBOEntry
{
	registerUnion registers[4];
};
static_assert(sizeof(VBOEntry) == sizeof(DWORD) * 4, "Error: Unexpected struct padding!");

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

	// Triangle Setup interfaces begin
	std_logic_vector_port<16> TRISETUP_v0PosX(PD_OUT, loader, "TRISETUP_v0PosX");
	std_logic_vector_port<16> TRISETUP_v0PosY(PD_OUT, loader, "TRISETUP_v0PosY");
	std_logic_vector_port<24> TRISETUP_v0PosInvZ(PD_OUT, loader, "TRISETUP_v0PosInvZ");
	std_logic_vector_port<16> TRISETUP_v1PosX(PD_OUT, loader, "TRISETUP_v1PosX");
	std_logic_vector_port<16> TRISETUP_v1PosY(PD_OUT, loader, "TRISETUP_v1PosY");
	std_logic_vector_port<24> TRISETUP_v1PosInvZ(PD_OUT, loader, "TRISETUP_v1PosInvZ");
	std_logic_vector_port<16> TRISETUP_v2PosX(PD_OUT, loader, "TRISETUP_v2PosX");
	std_logic_vector_port<16> TRISETUP_v2PosY(PD_OUT, loader, "TRISETUP_v2PosY");
	std_logic_vector_port<24> TRISETUP_v2PosInvZ(PD_OUT, loader, "TRISETUP_v2PosInvZ");
	std_logic_vector_port<16> TRISETUP_tex0_X(PD_OUT, loader, "TRISETUP_tex0_X");
	std_logic_vector_port<16> TRISETUP_tex0_Y(PD_OUT, loader, "TRISETUP_tex0_Y");
	std_logic_vector_port<16> TRISETUP_tex1_X(PD_OUT, loader, "TRISETUP_tex1_X");
	std_logic_vector_port<16> TRISETUP_tex1_Y(PD_OUT, loader, "TRISETUP_tex1_Y");
	std_logic_vector_port<16> TRISETUP_tex2_X(PD_OUT, loader, "TRISETUP_tex2_X");
	std_logic_vector_port<16> TRISETUP_tex2_Y(PD_OUT, loader, "TRISETUP_tex2_Y");
	std_logic_vector_port<32> TRISETUP_vertColor0_RGBA(PD_OUT, loader, "TRISETUP_vertColor0_RGBA");
	std_logic_vector_port<32> TRISETUP_vertColor1_RGBA(PD_OUT, loader, "TRISETUP_vertColor1_RGBA");
	std_logic_vector_port<32> TRISETUP_vertColor2_RGBA(PD_OUT, loader, "TRISETUP_vertColor2_RGBA");
	std_logic_port TRISETUP_readyForNewTri(PD_IN, loader, "TRISETUP_readyForNewTri");
	std_logic_port TRISETUP_newTriBegin(PD_OUT, loader, "TRISETUP_newTriBegin");
	// Triangle Setup interfaces end

	// Index Buffer Cache interfaces begin
	std_logic_port IBC_ReadEnable(PD_OUT, loader, "IBC_ReadEnable");
	std_logic_vector_port<30> IBC_ReadAddr(PD_OUT, loader, "IBC_ReadAddr");
	std_logic_vector_port<32> IBC_ReadData(PD_IN, loader, "IBC_ReadData");
	std_logic_port IBC_ReadReady(PD_IN, loader, "IBC_ReadReady");
	// Index Buffer Cache interfaces end

	// VBO FIFO interface
	std_logic_port VBO_Pushed(PD_IN, loader, "VBO_Pushed");
	std_logic_vector_port<16> VBO_BatchStartingIndex(PD_IN, loader, "VBO_BatchStartingIndex");
	std_logic_vector_port<16> VBO_BatchEndingIndex(PD_IN, loader, "VBO_BatchEndingIndex");
	std_logic_port VERTOUT_FIFO_rd_en(PD_OUT, loader, "VERTOUT_FIFO_rd_en");
	std_logic_vector_port<128> VERTOUT_FIFO_rd_data(PD_IN, loader, "VERTOUT_FIFO_rd_data");
	std_logic_port VERTOUT_FIFO_empty(PD_IN, loader, "VERTOUT_FIFO_empty");
	std_logic_port VBO_Ready(PD_OUT, loader, "VBO_Ready");

	// Command processor interfaces begin
	std_logic_port CMD_DrawReady(PD_OUT, loader, "CMD_DrawReady");

	std_logic_port CMD_SetStateReady(PD_OUT, loader, "CMD_SetStateReady");
	std_logic_port CMD_SetStateEnable(PD_IN, loader, "CMD_SetStateEnable");
	std_logic_vector_port<30> CMD_IndexBufferBaseAddr(PD_IN, loader, "CMD_IndexBufferBaseAddr");
	std_logic_vector_port<2> CMD_StateCullMode(PD_IN, loader, "CMD_StateCullMode");
	std_logic_vector_port<3> CMD_StatePrimTopology(PD_IN, loader, "CMD_StatePrimTopology");
	std_logic_vector_port<2> CMD_StateStripCutType(PD_IN, loader, "CMD_StateStripCutType");
	std_logic_vector_port<2> CMD_StateIndexFormat(PD_IN, loader, "CMD_StateIndexFormat");

	std_logic_port CMD_IA_Idle(PD_OUT, loader, "CMD_IA_Idle"); // Signal to let the command processor know that we are idle (have no work to do)
	// Command processor interfaces end

	// Debug interfaces
	std_logic_vector_port<6> DBG_IA_State(PD_OUT, loader, "DBG_IA_State");
	std_logic_port DBG_UsePrebuiltIB(PD_IN, loader, "DBG_UsePrebuiltIB");

	auto updateInterfaces = [&]()
	{
		if (IBC_ReadEnable.GetBoolVal() )
		{
			const unsigned readAddr = IBC_ReadAddr.GetUint32Val();
			const unsigned* const readPtr = reinterpret_cast<const unsigned* const>(readAddr);
			const unsigned indexData = (*readPtr) & 0xFFFF;
			printf("IB Cache[0x%08X] = 0x%04X\n", readAddr - currentIndexBufferBaseAddr, indexData);
			IBC_ReadData = indexData;
			IBC_ReadReady = true;
		}
		else
		{
			IBC_ReadReady = false;
		}
		
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

		if (TRISETUP_newTriBegin.GetBoolVal() )
		{
			const int16_t v0posX = TRISETUP_v0PosX.GetInt16Val();
			const int16_t v0posY = TRISETUP_v0PosY.GetInt16Val();
			const uint32_t v0posZ = TRISETUP_v0PosInvZ.GetUint32Val();
			const int16_t v1posX = TRISETUP_v1PosX.GetInt16Val();
			const int16_t v1posY = TRISETUP_v1PosY.GetInt16Val();
			const uint32_t v1posZ = TRISETUP_v1PosInvZ.GetUint32Val();
			const int16_t v2posX = TRISETUP_v2PosX.GetInt16Val();
			const int16_t v2posY = TRISETUP_v2PosY.GetInt16Val();
			const uint32_t v2posZ = TRISETUP_v2PosInvZ.GetUint32Val();

			const uint16_t v0texX = TRISETUP_tex0_X.GetUint16Val();
			const uint16_t v0texY = TRISETUP_tex0_Y.GetUint16Val();
			const uint16_t v1texX = TRISETUP_tex1_X.GetUint16Val();
			const uint16_t v1texY = TRISETUP_tex1_Y.GetUint16Val();
			const uint16_t v2texX = TRISETUP_tex2_X.GetUint16Val();
			const uint16_t v2texY = TRISETUP_tex2_Y.GetUint16Val();

			const uint32_t v0color = TRISETUP_vertColor0_RGBA.GetUint32Val();
			const uint32_t v1color = TRISETUP_vertColor1_RGBA.GetUint32Val();
			const uint32_t v2color = TRISETUP_vertColor2_RGBA.GetUint32Val();

			printf("New triangle. v0 = { pos = %hi, %hi, 0x%06X; tex = 0x%04X, 0x%04X; col = 0x%08X } v1 = { %hi, %hi, 0x%06X, tex = 0x%04X, 0x%04X; col = 0x%08X } v2 = { %hi, %hi, 0x%06X, tex = 0x%04X, 0x%04X; col = 0x%08X }\n",
				v0posX, v0posY, v0posZ, v0texX, v0texY, v0color,
				v1posX, v1posY, v1posZ, v1texX, v1texY, v1color,
				v2posX, v2posY, v2posZ, v2texX, v2texY, v2color);
		}
	};

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		DBG_UsePrebuiltIB = 0;

		updateInterfaces();
	}

	DBG_UsePrebuiltIB = 1;

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
		CMD_StateStripCutType = 0; // Strip cuts disabled
		CMD_StateIndexFormat = 2; // INDEX16
		CMD_IndexBufferBaseAddr = reinterpret_cast<unsigned>(&minCubeIB);
		currentIndexBufferBaseAddr = reinterpret_cast<unsigned>(&minCubeIB);
		updateInterfaces();
	}
	CMD_SetStateEnable = false;

	// Set the batch indices both to the same value to indicate that this is a non-indexed draw batch:
	VBO_BatchStartingIndex = 15;
	VBO_BatchEndingIndex = 15;

	TRISETUP_readyForNewTri = true;

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

	// Set the batch indices to different values to indicate that this is an indexed draw call:
	VBO_BatchStartingIndex = 0;
	VBO_BatchEndingIndex = 36;

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