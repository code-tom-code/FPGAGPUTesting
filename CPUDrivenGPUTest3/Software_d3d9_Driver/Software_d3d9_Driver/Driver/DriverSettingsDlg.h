#pragma once

#include "..\d3d9include.h"
class IDirect3DDevice9Hook;

struct DriverSettingsDlg
{
	~DriverSettingsDlg();
	void InitDialog(HWND initialCreateFocusWindow, HWND initialCreateDeviceWindow, IDirect3DDevice9Hook* const d3d9devhook);
	void UpdateDialog();

	HWND driverOptionsDlgWnd = NULL;
};

enum DepthOverrideSettings : unsigned char
{
	DOS_Default = 0,
	DOS_OverrideZDisable, // All depth testing and all depth writing is always disabled
	DOS_OverrideZEnableZWriteEnable, // All depth testing and all depth writing is always enabled
	DOS_OverrideZEnableZWriteDisable, // All depth testing is always enabled, all depth writing is always disabled (except for depth Clear() calls)

	DOS_NUM_ENTRIES // This must always be last
};

enum StencilOverrideSettings : unsigned char
{
	SOS_Default = 0,
	SOS_OverrideStencilDisable, // All stencil testing and all stencil writing is disabled (except for stencil Clear() calls)
	SOS_OverrideStencilEnable, // Stencil testing is always enabled

	SOS_NUM_ENTRIES // This must always be last
};

enum FillModeOverrideSettings : unsigned char
{
	FMOS_Default = 0,
	FMOS_OverrideFillSolid, // Always use D3DFILL_SOLID
	FMOS_OverrideFillWireframe, // Always use D3DFILL_WIREFRAME
	FMOS_OverrideFillPoint, // Always use D3DFILL_POINT

	FMOS_NUM_ENTRIES // This must always be last
};

enum ShadeModeOverrideSettings : unsigned char
{
	SMOS_Default = 0,
	SMOS_OverrideShadeFlat, // Always use D3DSHADE_FLAT
	SMOS_OverrideShadeGouraud, // Always use D3DSHADE_GOURAUD

	SMOS_NUM_ENTRIES // This must always be last
};

enum CullModeOverrideSettings : unsigned char
{
	CMOS_Default = 0,
	CMOS_OverrideCullCW, // Always use D3DCULL_CW
	CMOS_OverrideCullCCW, // Always use D3DCULL_CCW
	CMOS_OverrideCullNone, // Always use D3DCULL_NONE

	CMOS_NUM_ENTRIES // This must always be last
};

enum FogModeOverrideSettings : unsigned char
{
	FOGOS_Default = 0,
	FOGOS_OverrideFogDisable, // All fogging is disabled
	FOGOS_OverrideFog_PixelFogEnable, // Pixel fogging is force-enabled
	FOGOS_OverrideFog_VertexFogEnable, // Vertex fogging is force-enabled

	FOGOS_NUM_ENTRIES // This must always be last
};

enum AlphaBlendOverrideSettings : unsigned char
{
	ABOS_Default = 0,
	ABOS_OverrideAlphaBlendDisable, // All alpha blending is disabled
	ABOS_OverrideAlphaBlendAdditive, // Alpha blending is forced to use Additive Blending
	ABOS_OverrideAlphaBlendMultiplicative, // Alpha blending is forced to use Multiplicative Blending
	ABOS_OverrideAlphaBlendAlpha, // Alpha blending is forced to use Alpha Blending
	ABOS_OverrideAlphaBlendMod2x, // Alpha blending is forced to use Mod2x Blending

	ABOS_NUM_ENTRIES // This must always be last
};

enum AlphaTestOverrideSettings : unsigned char
{
	ATOS_Default = 0,
	ATOS_OverrideAlphaTestDisable, // All alpha testing is disabled
	ATOS_OverrideAlphaTestGreaterEqual1, // Alpha testing is forced enabled and the test is configured for >= 1
	ATOS_OverrideAlphaTestLess128, // Alpha testing is forced enabled and the test is configured for < 128
	ATOS_OverrideAlphaTestEqual255, // Alpha testing is forced enabled and the test is configured for = 255
	ATOS_OverrideAlphaTestNotEqual0, // Alpha testing is forced enabled and the test is configured for != 0

	ATOS_NUM_ENTRIES // This must always be last
};

enum TexAddressOverrideSettings : unsigned char
{
	TAOS_Default = 0,
	TAOS_OverrideWrap, // All texture addressing modes are set to D3DTADDRESS_WRAP
	TAOS_OverrideMirror, // All texture addressing modes are set to D3DTADDRESS_MIRROR
	TAOS_OverrideClamp, // All texture addressing modes are set to D3DTADDRESS_CLAMP
	TAOS_OverrideMirrorOnce, // All texture addressing modes are set to D3DTADDRESS_MIRRORONCE
	TAOS_OverrideBorderDefault, // All texture addressing modes are set to D3DTADDRESS_BORDER (border color unchanged)
	TAOS_OverrideBorderOpaqueBlack, // All texture addressing modes are set to D3DTADDRESS_BORDER (border color set to 0xFF000000)
	TAOS_OverrideBorderTransparentBlack, // All texture addressing modes are set to D3DTADDRESS_BORDER (border color set to 0x00000000)
	TAOS_OverrideBorderOpaqueWhite, // All texture addressing modes are set to D3DTADDRESS_BORDER (border color set to 0xFFFFFFFF)

	TAOS_NUM_ENTRIES // This must always be last
};

enum TexModeOverrideSettings : unsigned char
{
	TMOS_Default = 0,
	TMOS_OverrideBlack, // Force output black
	TMOS_OverrideWhite, // Force output white
	TMOS_OverrideTexture, // Force output just the texture color (ignore vertex color)
	TMOS_OverrideVertColor, // Force output just the vertex color (ignore the texture color)
	TMOS_OverrideTexcoords, // Force output the texcoords for debugging
	TMOS_OverrideBilinearInterp, // Force output the bilinear interpolation factors for debugging
	TMOS_OverrideTexModVC, // Force output the texture color multiplied with the vertex color
	TMOS_OverrideDepth, // Force output the depth value for debugging
	TMOS_OverrideStencil, // Force output the stencil value for debugging

	TMOS_NUM_ENTRIES // This must always be last
};

enum TexFilterOverrideSettings : unsigned char
{
	TFOS_Default = 0,
	TFOS_OverridePoint, // Force point sampling
	TFOS_OverrideMinMagLinearMipPoint, // Force min/mag = bilinear, mip = point
	TFOS_OverrideMinMagPointMipLinear, // Force min/mag = point, mip = linear
	TFOS_OverrideTrilinear, // Force trilinear sampling
	TFOS_OverrideAnisotropic, // Force anisotropic sampling

	TFOS_NUM_ENTRIES // This must always be last
};
