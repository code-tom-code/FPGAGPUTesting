#include "AssembleDXToken.h"
#include "..\Software_d3d9_Driver\ShaderAnalysis.h"

struct validMinorPixelShaderModels
{
	const bool minorVers[5];
};

struct validMinorVertexShaderModels
{
	const bool minorVers[2];
};

static const validMinorPixelShaderModels validMajorPixelShaderModels[4] =
{
	{false, false, false, false, false}, // There is no shader model 0!
	{true, true, true, true, true}, // ps_1_0, ps_1_1, ps_1_2, ps_1_3, ps_1_4
	{true, true, true, false, false}, // ps_2_0, ps_2_a, ps_2_b
	{true, false, false, false, false} // ps_3_0
};

static const validMinorVertexShaderModels validMajorVertexShaderModels[4] =
{
	{false, false}, // There is no shader model 0!
	{true, true}, // vs_1_0, vs_1_1
	{true, true}, // vs_2_0, vs_2_a (vs_2_x)
	{true, false} // vs_3_0
};

struct shaderModelRegisterPermissions
{
	const registerPermissions registerPermissions[D3DSPR_PREDICATE + 1] = { NotAvailable };
	const unsigned short registerCounts[D3DSPR_PREDICATE + 1] = { 0 };
};

static const shaderModelRegisterPermissions ps_1_x_Permissions = 
{
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_TEXTURE*/ReadWrite, 	/*The rest*/NotAvailable },
	{ /*D3DSPR_TEMP*/2,			/*D3DSPR_INPUT*/2,			/*D3DSPR_CONST*/8,			/*D3DSPR_TEXTURE*/4,			/*The rest*/0 }
};

static const shaderModelRegisterPermissions ps_1_4_Permissions = 
{
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_TEXTURE*/ReadOnly, 	/*The rest*/NotAvailable },
	{ /*D3DSPR_TEMP*/6,			/*D3DSPR_INPUT*/2,			/*D3DSPR_CONST*/8,			/*D3DSPR_TEXTURE*/6,			/*The rest*/0 }
};

static const shaderModelRegisterPermissions ps_2_0_Permissions = 
{
	// TODO: Validate all of the weird register types for ps_2_0:
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_TEXTURE*/ReadOnly, 	/*D3DSPR_RASTOUT*/NotAvailable, /*D3DSPR_ATTROUT*/NotAvailable, /*D3DSPR_TEXCRDOUT*/NotAvailable,	/*D3DSPR_CONSTINT*/NotAvailable,	/*D3DSPR_COLOROUT*/WriteOnly,	/*D3DSPR_DEPTHOUT*/WriteOnly,	/*D3DSPR_SAMPLER*/ReadOnly,	/*The rest*/NotAvailable },
	{ /*D3DSPR_TEMP*/32,		/*D3DSPR_INPUT*/2,			/*D3DSPR_CONST*/32,			/*D3DSPR_TEXTURE*/8,			/*D3DSPR_RASTOUT*/0,			/*D3DSPR_ATTROUT*/0,			/*D3DSPR_TEXCRDOUT*/0,				/*D3DSPR_CONSTINT*/0,				/*D3DSPR_COLOROUT*/4,			/*D3DSPR_DEPTHOUT*/1,			/*D3DSPR_SAMPLER*/16,		/*The rest*/0 }
};

static const shaderModelRegisterPermissions ps_2_x_Permissions = 
{
	// TODO: Validate all of the weird register types for ps_2_x:
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_TEXTURE*/ReadOnly, 	/*D3DSPR_RASTOUT*/NotAvailable, /*D3DSPR_ATTROUT*/NotAvailable, /*D3DSPR_TEXCRDOUT*/NotAvailable,	/*D3DSPR_CONSTINT*/ReadOnly,	/*D3DSPR_COLOROUT*/WriteOnly,	/*D3DSPR_DEPTHOUT*/WriteOnly,	/*D3DSPR_SAMPLER*/ReadOnly,	/*D3DSPR_CONST2*/NotAvailable,	/*D3DSPR_CONST3*/NotAvailable,	/*D3DSPR_CONST4*/NotAvailable,	/*D3DSPR_CONSTBOOL*/ReadOnly,	/*D3DSPR_LOOP*/NotAvailable,	/*D3DSPR_TEMPFLOAT16*/NotAvailable, /*D3DSPR_MISCTYPE*/NotAvailable,	/*D3DSPR_LABEL*/ReadOnly,	/*D3DSPR_PREDICATE*/ReadWrite },
	{ /*D3DSPR_TEMP*/32,		/*D3DSPR_INPUT*/2,			/*D3DSPR_CONST*/32,			/*D3DSPR_TEXTURE*/8,			/*D3DSPR_RASTOUT*/0,			/*D3DSPR_ATTROUT*/0,			/*D3DSPR_TEXCRDOUT*/0,				/*D3DSPR_CONSTINT*/16,			/*D3DSPR_COLOROUT*/4,			/*D3DSPR_DEPTHOUT*/1,			/*D3DSPR_SAMPLER*/16,		/*D3DSPR_CONST2*/0,				/*D3DSPR_CONST3*/0,				/*D3DSPR_CONST4*/0,				/*D3DSPR_CONSTBOOL*/16,			/*D3DSPR_LOOP*/0,				/*D3DSPR_TEMPFLOAT16*/0,			/*D3DSPR_MISCTYPE*/0,				/*D3DSPR_LABEL*/256,		/*D3DSPR_PREDICATE*/1 }
};

static const shaderModelRegisterPermissions ps_3_0_Permissions = 
{
	// TODO: Validate all of the weird register types for ps_3_0:
	// It looks like vPos is D3DSPR_MISCTYPE at index 0, and vFace is D3DSPR_MISCTYPE at index 1.
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_TEXTURE*/ReadOnly, /*D3DSPR_RASTOUT*/NotAvailable,	/*D3DSPR_ATTROUT*/NotAvailable,	/*D3DSPR_TEXCRDOUT*/NotAvailable,	/*D3DSPR_CONSTINT*/ReadOnly,	/*D3DSPR_COLOROUT*/WriteOnly,	/*D3DSPR_DEPTHOUT*/WriteOnly,	/*D3DSPR_SAMPLER*/ReadOnly,	/*D3DSPR_CONST2*/NotAvailable,	/*D3DSPR_CONST3*/NotAvailable,	/*D3DSPR_CONST4*/NotAvailable,	/*D3DSPR_CONSTBOOL*/ReadOnly,	/*D3DSPR_LOOP*/ReadOnly,	/*D3DSPR_TEMPFLOAT16*/NotAvailable, /*D3DSPR_MISCTYPE*/ReadOnly,	/*D3DSPR_LABEL*/ReadOnly,	/*D3DSPR_PREDICATE*/ReadWrite },
	{ /*D3DSPR_TEMP*/32,		/*D3DSPR_INPUT*/10,			/*D3DSPR_CONST*/224,		/*D3DSPR_TEXTURE*/16,		/*D3DSPR_RASTOUT*/0,			/*D3DSPR_ATTROUT*/0,			/*D3DSPR_TEXCRDOUT*/0,				/*D3DSPR_CONSTINT*/16,			/*D3DSPR_COLOROUT*/4,			/*D3DSPR_DEPTHOUT*/1,			/*D3DSPR_SAMPLER*/16,		/*D3DSPR_CONST2*/0,				/*D3DSPR_CONST3*/0,				/*D3DSPR_CONST4*/0,				/*D3DSPR_CONSTBOOL*/16,			/*D3DSPR_LOOP*/1,			/*D3DSPR_TEMPFLOAT16*/0,			/*D3DSPR_MISCTYPE*/2,			/*D3DSPR_LABEL*/256,		/*D3DSPR_PREDICATE*/1 }
};

static const shaderModelRegisterPermissions vs_1_1_Permissions = 
{
	// TODO: Validate all of the weird register types for vs_1_1:
	// Figure out where oPos, oFog, oPts go.
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_ADDR*/WriteOnly,	/*D3DSPR_RASTOUT*/WriteOnly,	/*D3DSPR_ATTROUT*/WriteOnly,	/*D3DSPR_TEXCRDOUT*/WriteOnly,	/*The rest*/NotAvailable },
	{ /*D3DSPR_TEMP*/12,		/*D3DSPR_INPUT*/16,			/*D3DSPR_CONST*/256,		/*D3DSPR_ADDR*/1,			/*D3DSPR_RASTOUT*/1,			/*D3DSPR_ATTROUT*/2,			/*D3DSPR_TEXCRDOUT*/8,			/*The rest*/0 }
};

static const shaderModelRegisterPermissions vs_2_0_Permissions = 
{
	// TODO: Validate all of the weird register types for vs_2_0:
	// Figure out where oPos, oFog, oPts go.
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_ADDR*/WriteOnly,	/*D3DSPR_RASTOUT*/WriteOnly,	/*D3DSPR_ATTROUT*/WriteOnly,	/*D3DSPR_TEXCRDOUT*/WriteOnly,	/*D3DSPR_CONSTINT*/ReadOnly,	/*D3DSPR_COLOROUT*/NotAvailable,	/*D3DSPR_DEPTHOUT*/NotAvailable,	/*D3DSPR_SAMPLER*/NotAvailable,	/*D3DSPR_CONST2*/NotAvailable,	/*D3DSPR_CONST3*/NotAvailable,	/*D3DSPR_CONST4*/NotAvailable,	/*D3DSPR_CONSTBOOL*/ReadOnly,	/*D3DSPR_LOOP*/ReadOnly,	/*D3DSPR_TEMPFLOAT16*/NotAvailable, /*D3DSPR_MISCTYPE*/NotAvailable,	/*D3DSPR_LABEL*/ReadOnly,	/*D3DSPR_PREDICATE*/NotAvailable },
	{ /*D3DSPR_TEMP*/12,		/*D3DSPR_INPUT*/16,			/*D3DSPR_CONST*/256,		/*D3DSPR_ADDR*/1,			/*D3DSPR_RASTOUT*/1,			/*D3DSPR_ATTROUT*/2,			/*D3DSPR_TEXCRDOUT*/8,			/*D3DSPR_CONSTINT*/16,			/*D3DSPR_COLOROUT*/0,				/*D3DSPR_DEPTHOUT*/0,				/*D3DSPR_SAMPLER*/0,			/*D3DSPR_CONST2*/0,				/*D3DSPR_CONST3*/0,				/*D3DSPR_CONST4*/0,				/*D3DSPR_CONSTBOOL*/16,			/*D3DSPR_LOOP*/1,			/*D3DSPR_TEMPFLOAT16*/0,			/*D3DSPR_MISCTYPE*/0,				/*D3DSPR_LABEL*/256,		/*D3DSPR_PREDICATE*/0 }
};

static const shaderModelRegisterPermissions vs_2_x_Permissions = 
{
	// TODO: Validate all of the weird register types for vs_2_x:
	// Figure out where oPos, oFog, oPts go.
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_ADDR*/WriteOnly,	/*D3DSPR_RASTOUT*/WriteOnly,	/*D3DSPR_ATTROUT*/WriteOnly,	/*D3DSPR_TEXCRDOUT*/WriteOnly,	/*D3DSPR_CONSTINT*/ReadOnly,	/*D3DSPR_COLOROUT*/NotAvailable,	/*D3DSPR_DEPTHOUT*/NotAvailable,	/*D3DSPR_SAMPLER*/NotAvailable,	/*D3DSPR_CONST2*/NotAvailable,	/*D3DSPR_CONST3*/NotAvailable,	/*D3DSPR_CONST4*/NotAvailable,	/*D3DSPR_CONSTBOOL*/ReadOnly,	/*D3DSPR_LOOP*/ReadOnly,	/*D3DSPR_TEMPFLOAT16*/NotAvailable, /*D3DSPR_MISCTYPE*/NotAvailable,	/*D3DSPR_LABEL*/ReadOnly,	/*D3DSPR_PREDICATE*/ReadWrite },
	{ /*D3DSPR_TEMP*/32,		/*D3DSPR_INPUT*/16,			/*D3DSPR_CONST*/256,		/*D3DSPR_ADDR*/1,			/*D3DSPR_RASTOUT*/1,			/*D3DSPR_ATTROUT*/2,			/*D3DSPR_TEXCRDOUT*/8,			/*D3DSPR_CONSTINT*/16,			/*D3DSPR_COLOROUT*/0,				/*D3DSPR_DEPTHOUT*/0,				/*D3DSPR_SAMPLER*/0,			/*D3DSPR_CONST2*/0,				/*D3DSPR_CONST3*/0,				/*D3DSPR_CONST4*/0,				/*D3DSPR_CONSTBOOL*/16,			/*D3DSPR_LOOP*/1,			/*D3DSPR_TEMPFLOAT16*/0,			/*D3DSPR_MISCTYPE*/0,				/*D3DSPR_LABEL*/256,		/*D3DSPR_PREDICATE*/1 }
};

static const shaderModelRegisterPermissions vs_3_0_Permissions = 
{
	// TODO: Validate all of the weird register types for vs_3_0:
	{ /*D3DSPR_TEMP*/ReadWrite, /*D3DSPR_INPUT*/ReadOnly,	/*D3DSPR_CONST*/ReadOnly,	/*D3DSPR_ADDR*/WriteOnly,	/*D3DSPR_RASTOUT*/NotAvailable,	/*D3DSPR_ATTROUT*/NotAvailable,	/*D3DSPR_OUTPUT*/WriteOnly,		/*D3DSPR_CONSTINT*/ReadOnly,	/*D3DSPR_COLOROUT*/NotAvailable,	/*D3DSPR_DEPTHOUT*/NotAvailable,	/*D3DSPR_SAMPLER*/ReadOnly,		/*D3DSPR_CONST2*/NotAvailable,	/*D3DSPR_CONST3*/NotAvailable,	/*D3DSPR_CONST4*/NotAvailable,	/*D3DSPR_CONSTBOOL*/ReadOnly,	/*D3DSPR_LOOP*/ReadOnly,	/*D3DSPR_TEMPFLOAT16*/NotAvailable, /*D3DSPR_MISCTYPE*/NotAvailable,	/*D3DSPR_LABEL*/ReadOnly,	/*D3DSPR_PREDICATE*/ReadWrite },
	{ /*D3DSPR_TEMP*/32,		/*D3DSPR_INPUT*/16,			/*D3DSPR_CONST*/256,		/*D3DSPR_ADDR*/1,			/*D3DSPR_RASTOUT*/0,			/*D3DSPR_ATTROUT*/0,			/*D3DSPR_OUTPUT*/12,			/*D3DSPR_CONSTINT*/16,			/*D3DSPR_COLOROUT*/0,				/*D3DSPR_DEPTHOUT*/0,				/*D3DSPR_SAMPLER*/4,			/*D3DSPR_CONST2*/0,				/*D3DSPR_CONST3*/0,				/*D3DSPR_CONST4*/0,				/*D3DSPR_CONSTBOOL*/16,			/*D3DSPR_LOOP*/1,			/*D3DSPR_TEMPFLOAT16*/0,			/*D3DSPR_MISCTYPE*/0,				/*D3DSPR_LABEL*/256,		/*D3DSPR_PREDICATE*/1 }
};

struct shaderModelInstructionPermissions
{
	enum psMinVersion : unsigned char
	{
		NoPSVersion = 0, // Not supported for pixel shaders ever
		PS_1_0_Instruction, // Supported starting with ps_1_0
		PS_1_2_Instruction, // Supported starting with ps_1_2
		PS_1_3_Instruction, // Supported starting with ps_1_3
		PS_1_4_Instruction, // Supported starting with ps_1_4
		PS_2_0_Instruction, // Supported starting with ps_2_0
		PS_2_x_Instruction, // Supported starting with ps_2_x
		PS_3_0_Instruction // Supported starting with ps_3_0
	};

	enum vsMinVersion : unsigned char
	{
		NoVSVersion = 0, // Not supported for vertex shaders ever
		VS_1_0_Instruction, // Supported starting with vs_1_0
		VS_2_0_Instruction, // Supported starting with vs_2_0
		VS_2_x_Instruction, // Supported starting with vs_2_x
		VS_3_0_Instruction // Supported starting with vs_3_0
	};

	psMinVersion psMin : 3;
	bool isPS_1_0_Only : 1; // This bit is set if the instruction does not carry over into ps_2_0 and up (so all of those weird instructions like bem, phase, texcrd, texdepth, etc.)
	bool isPrePS_1_4_Only : 1; // This bit is set if the instruction does not carry over into ps_1_4 (so all of those weird texturing instructions like texreg2ar, texm3x3, texbem, etc.)
	vsMinVersion vsMin : 3;
};
static_assert(sizeof(shaderModelInstructionPermissions) == sizeof(unsigned char), "Error: Unexpected struct packing!");

// _D3DSIO_NOP (0) thru _D3DSIO_DEFI (48)
static const shaderModelInstructionPermissions instructionPermissionsBlock0_48[] = 
{
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_NOP is always available
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_MOV is always available
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_ADD is always available
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_SUB is always available
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_MAD is always available
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_MUL is always available
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_RCP is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_RSQ is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_DP3 is always available
	{shaderModelInstructionPermissions::PS_1_2_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_DP4 is available in ps_1_2 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_MIN is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_MAX is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_SLT is available for all VS versions, but no PS versions
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_SGE is available for all VS versions, but no PS versions
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_EXP is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_LOG is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_LIT is available for all VS versions, but no PS versions
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_DST is available for all VS versions, but no PS versions
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_LRP is available for all PS versions, but only for vs_2_0 and up on the VS side
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_FRC is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_M4x4 is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_M4x3 is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_M3x4 is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_M3x3 is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_M3x2 is available in ps_2_0 and up (and all VS versions)
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_CALL is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_CALLNZ is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_3_0_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_LOOP is only available in ps_3_0, and starting with vs_2_0 on the VS side
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_RET is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_3_0_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_ENDLOOP is only available in ps_3_0, and starting with vs_2_0 on the VS side
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_LABEL is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_DCL is always available for VS, but for PS only starting with ps_2_0
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_POW is available starting with vs_2_0 and ps_2_0
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_CRS is available starting with vs_2_0 and ps_2_0
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_SGN is only available in vs_2_0 and up (not available for PS)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_ABS is available starting with vs_2_0 and ps_2_0
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_NRM is available starting with vs_2_0 and ps_2_0
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_SINCOS is available starting with vs_2_0 and ps_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_REP is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_ENDREP is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_IF is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_x_Instruction}, // _D3DSIO_IFC is available starting in ps_2_x and in vs_2_x
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_ELSE is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_ENDIF is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_x_Instruction}, // _D3DSIO_BREAK is available starting in ps_2_x and in vs_2_x
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_x_Instruction}, // _D3DSIO_BREAKC is available starting in ps_2_x and in vs_2_x
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_MOVA is only available in VS starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction}, // _D3DSIO_DEFB is available in ps_2_x and up, and starting with vs_2_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_0_Instruction} // _D3DSIO_DEFI is available in ps_2_x and up, and starting with vs_2_0
};
static_assert(ARRAYSIZE(instructionPermissionsBlock0_48) == (_D3DSIO_DEFI - _D3DSIO_NOP + 1), "Error: Unexpected array size!");

// _D3DSIO_TEXCOORD (64) thru _D3DSIO_BREAKP (96)
static const shaderModelInstructionPermissions instructionPermissionsBlock64_96[] = 
{
	{shaderModelInstructionPermissions::PS_1_0_Instruction, true, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXCOORD is "texcoord" for ps_1_1, ps_1_2, and ps_1_3 and it's "texcrd" for ps_1_4. The instruction is not available in ps_2_0+
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXKILL is only available for pixel shaders
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEX is "tex" in ps_1_1, ps_1_2, and ps_1_3 and it's "texld" in ps_1_4 and up. This is not available for vertex shaders.
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXBEM is only available before ps_1_4
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXBEML is only available before ps_1_4
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXREG2AR is only available before ps_1_4
	{shaderModelInstructionPermissions::PS_1_2_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXREG2GB is only available starting with ps_1_2 and before ps_1_4
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXM3x2PAD is only available before ps_1_4
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXM3x2TEX is only available before ps_1_4
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXM3x3PAD is only available before ps_1_4
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXM3x3TEX is only available before ps_1_4
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_RESERVED0 is never available for any shader model
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXM3x3SPEC is only available before ps_1_4
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXM3x3VSPEC is only available before ps_1_4
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_EXPP is only available for VS
	{shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_LOGP is only available for VS
	{shaderModelInstructionPermissions::PS_1_0_Instruction, true, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_CND is only available before ps_2_0 (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_DEF is always available
	{shaderModelInstructionPermissions::PS_1_2_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXREG2RGB is only available in ps_1_2 and ps_1_3 (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_1_2_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXDP3TEX is only available in ps_1_2 and ps_1_3 (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_1_3_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXM3x2DEPTH is only available in ps_1_3 (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_1_2_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXDP3 is only available in ps_1_2 and ps_1_3 (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_1_2_Instruction, false, true, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXM3x3 is only available in ps_1_2 and ps_1_3 (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_1_4_Instruction, true, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXDEPTH is only available in ps_1_4 (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_1_2_Instruction, false, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_CMP is only available in ps_1_2 and up (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_1_4_Instruction, true, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_BEM is only available in ps_1_4 (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_2_0_Instruction, false, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_DP2ADD is only available in ps_2_0 and up (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_DSX is only available in ps_2_x and up (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_DSY is only available in ps_2_x and up (and not available in VS at all)
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_TEXLDD is only available in ps_2_x and up (and not available in VS at all). It's actually only supported in ps_2_a but not in ps_2_b, but it is also supported in ps_3_0.
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_x_Instruction}, // _D3DSIO_SETP is available starting in ps_2_x and in vs_2_x
	{shaderModelInstructionPermissions::PS_3_0_Instruction, false, false, shaderModelInstructionPermissions::VS_3_0_Instruction}, // _D3DSIO_TEXLDL is available starting in ps_3_0 and in vs_3_0
	{shaderModelInstructionPermissions::PS_2_x_Instruction, false, false, shaderModelInstructionPermissions::VS_2_x_Instruction} // _D3DSIO_BREAKP is available starting in ps_2_x and in vs_2_x
};
static_assert(ARRAYSIZE(instructionPermissionsBlock64_96) == (_D3DSIO_BREAKP - _D3DSIO_TEXCOORD + 1), "Error: Unexpected array size!");

// _D3DSIO_PHASE (0xFFFD) thru _D3DSIO_END (0xFFFF)
static const shaderModelInstructionPermissions instructionPermissionsBlockFFFD_FFFF[] = 
{
	{shaderModelInstructionPermissions::PS_1_4_Instruction, true, false, shaderModelInstructionPermissions::NoVSVersion}, // _D3DSIO_PHASE is only allowed in ps_1_4 and no other shader models!
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction}, // _D3DSIO_COMMENT is allowed in all shader models
	{shaderModelInstructionPermissions::PS_1_0_Instruction, false, false, shaderModelInstructionPermissions::VS_1_0_Instruction} // _D3DSIO_END is allowed in all shader models
};
static_assert(ARRAYSIZE(instructionPermissionsBlockFFFD_FFFF) == (_D3DSIO_END - _D3DSIO_PHASE + 1), "Error: Unexpected array size!");

const shaderModelInstructionPermissions GetInstructionPermissions(const DEBUGGABLE_D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	if ( (opcode > _D3DSIO_DEFI && opcode < _D3DSIO_TEXCOORD) ||
		(opcode > _D3DSIO_BREAKP && opcode < _D3DSIO_PHASE) )
	{
		__debugbreak(); // Error: Unknown/invalid opcode!
		const shaderModelInstructionPermissions unknownInstruction = { shaderModelInstructionPermissions::NoPSVersion, false, false, shaderModelInstructionPermissions::NoVSVersion };
		return unknownInstruction;
	}

	if (opcode <= _D3DSIO_DEFI)
	{
		const unsigned short opcodeIndex = opcode;
		return instructionPermissionsBlock0_48[opcodeIndex];
	}
	else if (opcode >= _D3DSIO_PHASE)
	{
		const unsigned short opcodeIndex = opcode - _D3DSIO_PHASE;
		return instructionPermissionsBlockFFFD_FFFF[opcodeIndex];
	}
	else
	{
		const unsigned short opcodeIndex = opcode - _D3DSIO_TEXCOORD;
		return instructionPermissionsBlock64_96[opcodeIndex];
	}
}

static void ValidateInstructionForShaderModel(const ShaderInfo& inDXShaderInfo, const DEBUGGABLE_D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	const shaderModelInstructionPermissions instructionPermissions = GetInstructionPermissions(opcode);
	if (inDXShaderInfo.isPixelShader) // Pixel shaders
	{
		shaderModelInstructionPermissions::psMinVersion currentShaderModelVersion = shaderModelInstructionPermissions::NoPSVersion;
		if (inDXShaderInfo.shaderMajorVersion >= 3) currentShaderModelVersion = shaderModelInstructionPermissions::PS_3_0_Instruction;
		else if (inDXShaderInfo.shaderMajorVersion >= 2 && inDXShaderInfo.shaderMinorVersion != 0) currentShaderModelVersion = shaderModelInstructionPermissions::PS_2_x_Instruction;
		else if (inDXShaderInfo.shaderMajorVersion >= 2) currentShaderModelVersion = shaderModelInstructionPermissions::PS_2_0_Instruction;
		else if (inDXShaderInfo.shaderMinorVersion >= 4) currentShaderModelVersion = shaderModelInstructionPermissions::PS_1_4_Instruction;
		else if (inDXShaderInfo.shaderMinorVersion >= 3) currentShaderModelVersion = shaderModelInstructionPermissions::PS_1_3_Instruction;
		else if (inDXShaderInfo.shaderMinorVersion >= 2) currentShaderModelVersion = shaderModelInstructionPermissions::PS_1_2_Instruction;
		else currentShaderModelVersion = shaderModelInstructionPermissions::PS_1_0_Instruction;

		switch (instructionPermissions.psMin)
		{
		default:
		{
			__debugbreak(); // Should never be here!
		}
		// Intentional fall-through
		case shaderModelInstructionPermissions::NoPSVersion: // Not supported for pixel shaders ever
		{
			__debugbreak(); // Error: This instruction is not supported for use in pixel shaders!
		}
			break;
		case shaderModelInstructionPermissions::PS_1_0_Instruction: // Supported starting with ps_1_0
			if (instructionPermissions.isPS_1_0_Only && currentShaderModelVersion >= shaderModelInstructionPermissions::PS_2_0_Instruction) // ps_2_0 and up
			{
				__debugbreak(); // Error: This instruction may only be used in the ps_1_x shader models!
			}
			else if (instructionPermissions.isPrePS_1_4_Only && currentShaderModelVersion == shaderModelInstructionPermissions::PS_1_4_Instruction) // ps_1_4
			{
				__debugbreak(); // Error: This instruction may only be used before ps_1_4!
			}
			break;
		case shaderModelInstructionPermissions::PS_1_2_Instruction: // Supported starting with ps_1_2
			if (currentShaderModelVersion < instructionPermissions.psMin)
			{
				__debugbreak(); // Error: This instruction is not supported until ps_1_2
			}
			else if (instructionPermissions.isPS_1_0_Only && currentShaderModelVersion >= shaderModelInstructionPermissions::PS_2_0_Instruction) // ps_2_0 and up
			{
				__debugbreak(); // Error: This instruction may only be used in the ps_1_x shader models!
			}
			else if (instructionPermissions.isPrePS_1_4_Only && currentShaderModelVersion == shaderModelInstructionPermissions::PS_1_4_Instruction) // ps_1_4
			{
				__debugbreak(); // Error: This instruction may only be used before ps_1_4!
			}
			break;
		case shaderModelInstructionPermissions::PS_1_3_Instruction: // Supported starting with ps_1_3
			if (currentShaderModelVersion < instructionPermissions.psMin)
			{
				__debugbreak(); // Error: This instruction is not supported until ps_1_3
			}
			else if (instructionPermissions.isPS_1_0_Only && currentShaderModelVersion >= shaderModelInstructionPermissions::PS_2_0_Instruction) // ps_2_0 and up
			{
				__debugbreak(); // Error: This instruction may only be used in the ps_1_x shader models!
			}
			else if (instructionPermissions.isPrePS_1_4_Only && currentShaderModelVersion == shaderModelInstructionPermissions::PS_1_4_Instruction) // ps_1_4
			{
				__debugbreak(); // Error: This instruction may only be used before ps_1_4!
			}
			break;
		case shaderModelInstructionPermissions::PS_1_4_Instruction: // Supported starting with ps_1_4
			if (currentShaderModelVersion < instructionPermissions.psMin)
			{
				__debugbreak(); // Error: This instruction is not supported until ps_1_4
			}
			else if (instructionPermissions.isPS_1_0_Only && currentShaderModelVersion >= shaderModelInstructionPermissions::PS_2_0_Instruction) // ps_2_0 and up
			{
				__debugbreak(); // Error: This instruction may only be used in the ps_1_4 shader model!
			}
			break;
		case shaderModelInstructionPermissions::PS_2_0_Instruction: // Supported starting with ps_2_0
			if (currentShaderModelVersion < instructionPermissions.psMin)
			{
				__debugbreak(); // Error: This instruction is not supported until ps_2_0
			}
			break;
		case shaderModelInstructionPermissions::PS_2_x_Instruction: // Supported starting with ps_2_x
			if (currentShaderModelVersion < instructionPermissions.psMin)
			{
				__debugbreak(); // Error: This instruction is not supported until ps_2_x
			}
			break;
		case shaderModelInstructionPermissions::PS_3_0_Instruction: // Supported starting with ps_3_0
			if (currentShaderModelVersion < instructionPermissions.psMin)
			{
				__debugbreak(); // Error: This instruction is not supported until ps_3_0
			}
			break;
		}
	}
	else // Vertex shaders
	{
		switch (instructionPermissions.vsMin)
		{
		default:
		{
			__debugbreak(); // Should never be here!
		}
		// Intentional fall-through
		case shaderModelInstructionPermissions::NoVSVersion: // Not supported for vertex shaders ever
		{
			__debugbreak(); // Error: This instruction is not supported for use in vertex shaders!
		}
			break;
		case shaderModelInstructionPermissions::VS_1_0_Instruction: // Supported starting with vs_1_0
			break;
		case shaderModelInstructionPermissions::VS_2_0_Instruction: // Supported starting with vs_2_0
			if (inDXShaderInfo.shaderMajorVersion < 2)
			{
				__debugbreak(); // Error: This instruction is not supported until vs_2_0
			}
			break;
		case shaderModelInstructionPermissions::VS_2_x_Instruction: // Supported starting with vs_2_x
			if (inDXShaderInfo.shaderMajorVersion < 2 || (inDXShaderInfo.shaderMajorVersion == 2 && inDXShaderInfo.shaderMinorVersion == 0) )
			{
				__debugbreak(); // Error: This instruction is not supported until vs_2_x
			}
			break;
		case shaderModelInstructionPermissions::VS_3_0_Instruction: // Supported starting with vs_3_0
			if (inDXShaderInfo.shaderMajorVersion < 3)
			{
				__debugbreak(); // Error: This instruction is not supported until vs_3_0
			}
			break;
		}
	}
}

void GetRegisterPermissionsAndCount(const ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, registerPermissions& outRegPermissions, unsigned short& outRegCount)
{
	if (regType > D3DSPR_PREDICATE)
	{
		__debugbreak(); // Error: Register Type is invalid!
		return;
	}

	if (inDXShaderInfo.isPixelShader)
	{
		if (inDXShaderInfo.shaderMajorVersion == 1)
		{
			if (inDXShaderInfo.shaderMinorVersion < 4) // ps_1_1, ps_1_2, ps_1_3
			{
				outRegPermissions = ps_1_x_Permissions.registerPermissions[regType];
				outRegCount = ps_1_x_Permissions.registerCounts[regType];
			}
			else // ps_1_4
			{
				outRegPermissions = ps_1_4_Permissions.registerPermissions[regType];
				outRegCount = ps_1_4_Permissions.registerCounts[regType];
			}
		}
		else if (inDXShaderInfo.shaderMajorVersion == 2)
		{
			if (inDXShaderInfo.shaderMinorVersion == 0) // ps_2_0
			{
				outRegPermissions = ps_2_0_Permissions.registerPermissions[regType];
				outRegCount = ps_2_0_Permissions.registerCounts[regType];
			}
			else // ps_2_x
			{
				outRegPermissions = ps_2_x_Permissions.registerPermissions[regType];
				outRegCount = ps_2_x_Permissions.registerCounts[regType];
			}
		}
		else // ps_3_0
		{
			outRegPermissions = ps_3_0_Permissions.registerPermissions[regType];
			outRegCount = ps_3_0_Permissions.registerCounts[regType];
		}
	}
	else
	{
		if (inDXShaderInfo.shaderMajorVersion == 2)
		{
			if (inDXShaderInfo.shaderMinorVersion == 0) // vs_2_0
			{
				outRegPermissions = vs_2_0_Permissions.registerPermissions[regType];
				outRegCount = vs_2_0_Permissions.registerCounts[regType];
			}
			else // vs_2_x
			{
				outRegPermissions = vs_2_x_Permissions.registerPermissions[regType];
				outRegCount = vs_2_x_Permissions.registerCounts[regType];
			}
		}
		else if (inDXShaderInfo.shaderMajorVersion == 3) // vs_3_0
		{
			outRegPermissions = vs_3_0_Permissions.registerPermissions[regType];
			outRegCount = vs_3_0_Permissions.registerCounts[regType];
		}
		else // vs_1_1
		{
			outRegPermissions = vs_1_1_Permissions.registerPermissions[regType];
			outRegCount = vs_1_1_Permissions.registerCounts[regType];
		}
	}
}

static void ValidateSourceRegTypeAndCount(const ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE sourceRegType, const unsigned short sourceRegIndex)
{
	registerPermissions regPermissions = NotAvailable;
	unsigned short maxRegCount = 0;
	GetRegisterPermissionsAndCount(inDXShaderInfo, sourceRegType, regPermissions, maxRegCount);

	if (regPermissions == NotAvailable)
	{
		__debugbreak(); // Error: This register type is not available in this shader model!
	}
	else
	{
		if (regPermissions == WriteOnly)
		{
			__debugbreak(); // Error: This register is not readable and cannot be used as a source parameter register!
		}
		if (sourceRegIndex >= maxRegCount)
		{
			__debugbreak(); // Error: Register Index is out of bounds for this shader model!
		}
	}
}

static void ValidateDestRegTypeAndCount(const ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE destRegType, const unsigned short destRegIndex)
{
	registerPermissions regPermissions = NotAvailable;
	unsigned short maxRegCount = 0;
	GetRegisterPermissionsAndCount(inDXShaderInfo, destRegType, regPermissions, maxRegCount);

	if (regPermissions == NotAvailable)
	{
		__debugbreak(); // Error: This register type is not available in this shader model!
	}
	else
	{
		if (regPermissions == ReadOnly)
		{
			__debugbreak(); // Error: This register is not writeable and cannot be used as a destination parameter register!
		}
		if (destRegIndex >= maxRegCount)
		{
			__debugbreak(); // Error: Register Index is out of bounds for this shader model!
		}
	}
}

static void ValidateShaderModel(const ShaderInfo& inDXShaderInfo)
{
	if (inDXShaderInfo.shaderMajorVersion < 1)
	{
		__debugbreak(); // Error: There is no shader model 0!
		return;
	}
	if (inDXShaderInfo.shaderMajorVersion > 3)
	{
		__debugbreak(); // Error: Shader models 4/5/6/etc. are not allowed in D3D9!
		return;
	}

	if (inDXShaderInfo.isPixelShader)
	{
		if (inDXShaderInfo.shaderMinorVersion > 4)
		{
			__debugbreak(); // Invalid pixel shader minor shader version number!
			return;
		}

		const bool shaderModelIsValid = validMajorPixelShaderModels[inDXShaderInfo.shaderMajorVersion].minorVers[inDXShaderInfo.shaderMinorVersion];
		if (!shaderModelIsValid)
		{
			__debugbreak(); // Error: Invalid shader model specified!
		}
	}
	else
	{
		if (inDXShaderInfo.shaderMinorVersion > 1)
		{
			__debugbreak(); // Invalid vertex shader minor shader version number!
			return;
		}

		const bool shaderModelIsValid = validMajorVertexShaderModels[inDXShaderInfo.shaderMajorVersion].minorVers[inDXShaderInfo.shaderMinorVersion];
		if (!shaderModelIsValid)
		{
			__debugbreak(); // Error: Invalid shader model specified!
		}
	}
}

const instructionToken AssembleInstructionToken(const ShaderInfo& inDXShaderInfo, const DEBUGGABLE_D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode, const unsigned char numRelativeAddrTokens /*= 0*/)
{
#ifdef _DEBUG
	ValidateShaderModel(inDXShaderInfo);
	if (numRelativeAddrTokens > 5) // I think that 5 is the max if you use a relative addressing token for every dst and src parameter in a srcSrcSrcSrcDst instruction
	{
		__debugbreak(); // Invalid number of relative addressing tokens!
	}
	if (inDXShaderInfo.isPixelShader && inDXShaderInfo.shaderMajorVersion < 3 && numRelativeAddrTokens > 0)
	{
		__debugbreak(); // Error: Relative addressing in pixel shaders is not supported until ps_3_0!
	}
	if (opcode > _D3DSIO_DEFI && opcode < _D3DSIO_TEXCOORD)
	{
		__debugbreak(); // Invalid opcode!
	}
	else if (opcode > _D3DSIO_BREAKP && opcode < _D3DSIO_PHASE)
	{
		__debugbreak(); // Out of range opcode!
	}

	// Validate that each instruction is valid to be used in the given shader model
	ValidateInstructionForShaderModel(inDXShaderInfo, opcode);
#endif
	instructionToken ret;
	ret.reservedZero = 0;
	ret.instructionOrParameterMarkerBit = instructionTokenMarker;
	ret.opcode = opcode;
	ret.opcodeControls = OpCtrl_Reserved0;
	if (inDXShaderInfo.shaderMajorVersion < 2)
	{
		ret.instructionLengthDWORDs = 0;
	}
	else
	{
		opcodeDisplayType currentOpcodeType = GetOpcodeDisplayType( (const D3DSHADER_INSTRUCTION_OPCODE_TYPE)opcode);
		switch (opcode)
		{
		case _D3DSIO_LABEL:
			currentOpcodeType = srcOnly;
			break;
		case _D3DSIO_DCL:
			currentOpcodeType = dstOnly;
			break;
		case _D3DSIO_SINCOS:
			if (inDXShaderInfo.shaderMajorVersion < 3)
				currentOpcodeType = srcSrcSrcDst;
			else
				currentOpcodeType = srcDst;
			break;
		case _D3DSIO_DEFB:
			currentOpcodeType = dstOnly;
			break;
		case _D3DSIO_DEFI:
			currentOpcodeType = srcSrcSrcDst;
			break;
		case _D3DSIO_DEF:
			currentOpcodeType = srcSrcSrcDst;
			break;
		case _D3DSIO_TEX:
			if (inDXShaderInfo.shaderMajorVersion < 2)
			{
				if (inDXShaderInfo.shaderMinorVersion < 4)
				{
					currentOpcodeType = dstOnly; // ps1.1, ps1.2, ps1.3
				}
				else
				{
					currentOpcodeType = srcDst; // ps1.4
				}
			}
			else
			{
				// SM2.0+:
				currentOpcodeType = srcSrcDst;
			}
			break;
		}

		switch (currentOpcodeType)
		{
		default:
	#ifdef _DEBUG
			__debugbreak(); // Error: Unknown opcode!
	#endif
		case justOpcode:
			ret.instructionLengthDWORDs = numRelativeAddrTokens; // Opcode
			break;
		case srcOnly:
			ret.instructionLengthDWORDs = 1 + numRelativeAddrTokens;
			break;
		case srcSrcOnly:
			ret.instructionLengthDWORDs = 2 + numRelativeAddrTokens;
			break;
		case dstOnly:
			ret.instructionLengthDWORDs = 1 + numRelativeAddrTokens;
			break;
		case srcDst:
			ret.instructionLengthDWORDs = 2 + numRelativeAddrTokens;
			break;
		case srcSrcDst:
			ret.instructionLengthDWORDs = 3 + numRelativeAddrTokens;
			break;
		case srcSrcSrcDst:
			ret.instructionLengthDWORDs = 4 + numRelativeAddrTokens;
			break;
		case srcSrcSrcSrcDst: // Only ever used with D3DSIO_TEXLDD
			ret.instructionLengthDWORDs = 5 + numRelativeAddrTokens;
			break;
		case customOpcode:
			__debugbreak(); // TODO: Implement this!
			ret.instructionLengthDWORDs = numRelativeAddrTokens;
			break;
		}
	}
	ret.predicated = false;
	ret.coIssue = false;

	return ret;
}

static void ValidateSourceModifier(const struct ShaderInfo& inDXShaderInfo, const debuggableSourceModifierType srcMod)
{
	if (inDXShaderInfo.isPixelShader) // Pixel shader
	{
		if (inDXShaderInfo.shaderMajorVersion == 3)
		{
			switch (srcMod)
			{
			case SM_None:
			case SM_Negate:
			case SM_Not:
			case SM_Abs:
			case SM_AbsNegate:
				break;
			default:
			{
				__debugbreak(); // Invalid source modifier for ps_3_0!
			}
			}
		}
		else if (inDXShaderInfo.shaderMajorVersion == 2)
		{
			switch (srcMod)
			{
			case SM_None:
			case SM_Negate:
				break;
			case SM_Not:
				if (inDXShaderInfo.shaderMinorVersion == 0)
				{
					__debugbreak(); // Error: not() source modifier is only available in ps_2_x and up!
				}
				break;
			default:
			{
				__debugbreak(); // Invalid source modifier for ps_2_0!
			}
			}
		}
		else // ps_1_x:
		{
			if (srcMod >= SM_Abs)
			{
				__debugbreak(); // Error: abs() and not() are only available in ps_3_0!
			}

			if (inDXShaderInfo.shaderMinorVersion < 4) // ps_1_1, ps_1_2, and ps_1_3
			{
				if (srcMod == SM_x2 || srcMod == SM_x2Negate)
				{
					__debugbreak(); // Error: x2 (and also -x2) source mods are not available until ps_1_4!
				}
			}
		}
	}
	else // Vertex shader
	{
		switch (srcMod)
		{
		case SM_None:
		case SM_Negate:
			break;
		case SM_Abs:
		case SM_AbsNegate:
			if (inDXShaderInfo.shaderMajorVersion < 3)
			{
				__debugbreak(); // Error: abs() source modifier is only available in vs_3_0 and up!
			}
			break;
		case SM_Not:
			if (inDXShaderInfo.shaderMajorVersion < 2 || (inDXShaderInfo.shaderMajorVersion == 2 && inDXShaderInfo.shaderMinorVersion == 0) )
			{
				__debugbreak(); // Error: not() source modifier is only available in vs_2_x and up!
			}
			break;
		default:
		{
			__debugbreak(); // Invalid source modifier for vs_x_x
		}
		}
	}
}

// Validate that the swizzle is valid (only certain source swizzles are valid up until ps_2_x).
// There's a big table on MSDN: https://docs.microsoft.com/en-us/windows/win32/direct3dhlsl/dx9-graphics-reference-asm-ps-registers-modifiers-source-register-swizzling#source-swizzling
static void ValidateSourceSwizzle(const struct ShaderInfo& inDXShaderInfo, const debuggableFullSwizzle fullSwizzle)
{
	if (fullSwizzle > 0xFF)
	{
		__debugbreak(); // Error: Swizzle out of range!
	}

	if (inDXShaderInfo.isPixelShader && inDXShaderInfo.shaderMajorVersion < 3)
	{
		switch (fullSwizzle)
		{
		case _ReplicateX:
		case _ReplicateY:
			if (inDXShaderInfo.shaderMajorVersion == 1 && inDXShaderInfo.shaderMinorVersion < 4)
			{
				__debugbreak(); // Error: X and Y replicate-swizzles are not available in ps_1_0, ps_1_1, ps_1_2, or ps_1_3 (needs ps_1_4 or higher!)
			}
			break;
		case _ReplicateZ:
			// Technically this is only available for shader models less than ps_1_4 if the destination write mask is .wwww but this is not verifiable from this function
			break;
		case _ReplicateW:
		case _NoSwizzleXYZW:
			// These two (replicate-W and XYZW) are always available in every shader model
			break;
		case _yzxw:
		case _zxyw:
		case _wzyx:
			if (inDXShaderInfo.shaderMajorVersion < 2)
			{
				__debugbreak(); // Error: Shuffle swizzles are not available until ps_2_0!
			}
			break;
		default: // Arbitrary swizzle
			if (inDXShaderInfo.shaderMajorVersion < 2 || (inDXShaderInfo.shaderMajorVersion == 2 && inDXShaderInfo.shaderMinorVersion == 0) )
			{
				__debugbreak(); // Error: Arbitrary swizzles are not supported until ps_2_x!
			}
		}
	}
}

const srcParameterToken AssembleSourceParameterToken(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex, 
	const debuggableSwizzleChannel swizzleChannelR /*= sourceX*/, const debuggableSwizzleChannel swizzleChannelG /*= sourceY*/, const debuggableSwizzleChannel swizzleChannelB /*= sourceZ*/, const debuggableSwizzleChannel swizzleChannelA /*= sourceW*/, 
	const debuggableSourceModifierType srcMod /*= SM_None*/, const bool usesRelativeAddressing /*= false*/)
{
#ifdef _DEBUG
	ValidateShaderModel(inDXShaderInfo);
	if (regIndex >= (1 << 8) )
	{
		__debugbreak(); // Out of range register index!
	}
	if (regType > D3DSPR_PREDICATE)
	{
		__debugbreak(); // Unknown register type!
	}
	if (srcMod > SM_Not)
	{
		__debugbreak(); // Unknown source mod type!
	}
	if (swizzleChannelR > swizzleChannelA)
	{
		__debugbreak(); // Unknown swizzle index for R channel!
	}
	if (swizzleChannelG > swizzleChannelA)
	{
		__debugbreak(); // Unknown swizzle index for G channel!
	}
	if (swizzleChannelB > swizzleChannelA)
	{
		__debugbreak(); // Unknown swizzle index for B channel!
	}
	if (swizzleChannelA > swizzleChannelA)
	{
		__debugbreak(); // Unknown swizzle index for A channel!
	}
	ValidateSourceModifier(inDXShaderInfo, srcMod);
	ValidateSourceSwizzle(inDXShaderInfo, (const debuggableFullSwizzle)( (swizzleChannelR) | (swizzleChannelG << 2) | (swizzleChannelB << 4) | (swizzleChannelA << 6) ) );
	if (inDXShaderInfo.isPixelShader && inDXShaderInfo.shaderMajorVersion < 3 && usesRelativeAddressing == true)
	{
		__debugbreak(); // Error: Relative addressing is only available in ps_3_0 (or in vertex shaders)
	}
	ValidateSourceRegTypeAndCount(inDXShaderInfo, regType, regIndex);
#endif
	srcParameterToken ret;
	ret.srcParameter.reserved_mustBeZero = 0;
	ret.srcParameter.instructionParameterBit = parameterTokenMarker;
	ret.srcParameter.registerIndex = regIndex;
	ret.srcParameter.registerType_lowBits = (regType & 0x7);
	ret.srcParameter.registerType_highBits = ( (regType >> 3) & 0x3);
	ret.srcParameter.sourceModifier = srcMod;
	ret.srcParameter.sourceSwizzle.channelSwizzles.xSwizzle = swizzleChannelR;
	ret.srcParameter.sourceSwizzle.channelSwizzles.ySwizzle = swizzleChannelG;
	ret.srcParameter.sourceSwizzle.channelSwizzles.zSwizzle = swizzleChannelB;
	ret.srcParameter.sourceSwizzle.channelSwizzles.wSwizzle = swizzleChannelA;
	ret.srcParameter.relativeAddressingEnable = usesRelativeAddressing ? relativeAddressing : absoluteAddressing;
	return ret;
}

const srcParameterToken AssembleSourceParameterToken(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex, 
	const debuggableFullSwizzle swizzle /*= _NoSwizzleRGBA*/, const debuggableSourceModifierType srcMod /*= SM_None*/, const bool usesRelativeAddressing /*= false*/)
{
	const debuggableSwizzleChannel swizzleR = (const debuggableSwizzleChannel)(swizzle & 0x3);
	const debuggableSwizzleChannel swizzleG = (const debuggableSwizzleChannel)( (swizzle >> 2) & 0x3);
	const debuggableSwizzleChannel swizzleB = (const debuggableSwizzleChannel)( (swizzle >> 4) & 0x3);
	const debuggableSwizzleChannel swizzleA = (const debuggableSwizzleChannel)( (swizzle >> 6) & 0x3);
	return AssembleSourceParameterToken(inDXShaderInfo, regType, regIndex, swizzleR, swizzleG, swizzleB, swizzleA, srcMod, usesRelativeAddressing);
}

const srcParameterToken AssembleSourceParameterTokenReplicateSwizzle(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex, const debuggableSwizzleChannel replicateChannelIndex/* = sourceX*/,
	const debuggableSourceModifierType srcMod /*= SM_None*/, const bool usesRelativeAddressing /*= false*/)
{
	return AssembleSourceParameterToken(inDXShaderInfo, regType, regIndex, replicateChannelIndex, replicateChannelIndex, replicateChannelIndex, replicateChannelIndex, srcMod, usesRelativeAddressing);
}

const srcParameterToken AssembleSourceParameterTokenNoSwizzle(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex,
	const debuggableSourceModifierType srcMod /*= SM_None*/, const bool usesRelativeAddressing /*= false*/)
{
	return AssembleSourceParameterToken(inDXShaderInfo, regType, regIndex, sourceX, sourceY, sourceZ, sourceW, srcMod, usesRelativeAddressing);
}

static void ValidateDestModifier(const struct ShaderInfo& inDXShaderInfo, const resultModifierType destMod)
{
	if (!inDXShaderInfo.isPixelShader) // Vertex shader checks
	{
		if (destMod == RM_CentroidSample)
		{
			__debugbreak(); // Error: Cannot use Centroid Sampling from a Vertex Shader!
		}
		else if (destMod == RM_Saturate && inDXShaderInfo.shaderMajorVersion < 3)
		{
			__debugbreak(); // Error: Cannot use the _sat Saturate() destination modifier until vs_3_0 (or ps_2_0)
		}
	}
	else // Pixel shader checks
	{
		if (destMod == RM_Saturate && inDXShaderInfo.shaderMajorVersion < 2)
		{
			__debugbreak(); // Error: Cannot use the _sat Saturate() destination modifier until ps_2_0 (or vs_3_0)
		}
	}
}

static void ValidateDestRelativeAddressing(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const bool usesRelativeAddressing)
{
	if (usesRelativeAddressing)
	{
		if (!inDXShaderInfo.isPixelShader) // Vertex shader checks
		{
			if (inDXShaderInfo.shaderMajorVersion < 3)
			{
				__debugbreak(); // Error: Cannot use destination relative addressing before vs_3_0 (and never in any pixel shader)
			}
			if (regType != D3DSPR_OUTPUT)
			{
				__debugbreak(); // Error: Can only use destination relative addressing with o# output registers!
			}
		}
		else // Pixel shader checks
		{
			__debugbreak(); // Error: Pixel shaders cannot use destination relative addressing, only vertex shaders can do that and only in vs_3_0!
		}
	}
}

static void ValidateDestShiftScale(const struct ShaderInfo& inDXShaderInfo, const signed char shiftScale)
{
	if (shiftScale != 0)
	{
		if (inDXShaderInfo.isPixelShader && inDXShaderInfo.shaderMajorVersion == 1)
		{
			// This is the table of supported shifts for each pixel shader version:
			/*		ps_1_1 thru ps_1_3 | ps_1_4
			_x2				yes				yes
			_x4				yes				yes
			_x8				no				yes
			_d2				yes				yes
			_d4				no				yes
			_d8				no				yes
			*/
			if (inDXShaderInfo.shaderMinorVersion == 4) // ps_1_4
			{
				if (shiftScale > 3 || shiftScale < -3)
				{
					__debugbreak(); // Out of range shift for ps_1_4!
				}
			}
			else // ps_1_1, ps_1_2, or ps_1_3:
			{
				if (shiftScale > 2 || shiftScale < -1)
				{
					__debugbreak(); // Out of range shift for ps_1_1 thru ps_1_3!
				}
			}
		}
		else
		{
			__debugbreak(); // Shift scales may only be used with the ps_1_x shader models!
		}
	}
}

const dstParameterToken AssembleDestParameterToken(const struct ShaderInfo& inDXShaderInfo, const D3DSHADER_PARAM_REGISTER_TYPE regType, const unsigned short regIndex, const writeMaskType writeMask /*= WM_ALL*/, const resultModifierType destMod /*= RM_None*/, const signed char shiftScale /*= 0*/, const bool usesRelativeAddressing /*= false*/)
{
#ifdef _DEBUG
	ValidateShaderModel(inDXShaderInfo);
	if (regIndex >= (1 << 8) )
	{
		__debugbreak(); // Out of range register index!
	}
	if (regType > D3DSPR_PREDICATE)
	{
		__debugbreak(); // Unknown register type!
	}
	if (destMod > RM_CentroidSample)
	{
		__debugbreak(); // Unknown dest mod type!
	}
	ValidateDestModifier(inDXShaderInfo, destMod);
	ValidateDestRelativeAddressing(inDXShaderInfo, regType, usesRelativeAddressing);
	ValidateDestShiftScale(inDXShaderInfo, shiftScale);
	if (writeMask > WM_ALL)
	{
		__debugbreak(); // Out of range write mask!
	}
	if (writeMask == WM_None)
	{
		__debugbreak(); // Illegal to have a "none" write mask! (Maybe legal on a NOP instruction?)
	}
	ValidateDestRegTypeAndCount(inDXShaderInfo, regType, regIndex);
#endif
	dstParameterToken ret;
	ret.dstParameter.reserved_mustBeZero = 0;
	ret.dstParameter.instructionParameterBit = parameterTokenMarker;
	ret.dstParameter.registerIndex = regIndex;
	ret.dstParameter.registerType_lowBits = (regType & 0x7);
	ret.dstParameter.registerType_highBits = ( (regType >> 3) & 0x3);
	ret.dstParameter.resultModifierStruct.resultModifier = destMod;
	ret.dstParameter.writeMaskStruct.writeMask = writeMask;
	ret.dstParameter.resultShiftScale = shiftScale;
	ret.dstParameter.relativeAddressingEnable = usesRelativeAddressing ? relativeAddressing : absoluteAddressing;
	return ret;
}
