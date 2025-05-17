#pragma once

#include "..\INIVar.h"

enum driverForceOption : unsigned
{
	DFO_AppDefault = 0,
	DFO_ForceEnable = 1,
	DFO_ForceDisable = 2
};

extern INIVar ForceWindowedMode; // Forces Windowed mode, Fullscreen mode, or AppDefault
extern INIVar ForceBackbufferColorDepth; // Valid values are 0 (default), 8, 16, 24, or 32
extern INIVar ForceRefreshRate; // Valid values are 0 (default), or a refresh rate integer
extern INIVar ForceBackbufferWidth; // Valid values are 0 (default), or a backbuffer width, in pixels (for example: 640)
extern INIVar ForceBackbufferHeight; // Valid values are 0 (default), or a backbuffer height, in pixels (for example: 480)
extern INIVar ForceVSync; // Forces VSync on (enabled), off (disabled), or AppDefault
extern INIVar EmulateSWVP; // Forces the driver to run vertex shaders in software to emulate what the device does, then submits all pretransformed triangles to the GPU for rasterization
extern INIVar ForceMultithreaded; // Force D3DCREATE_MULTITHREADED (for games that were designed for single-threaded CPU's but that now have to run on multi-threaded ones). The flag acquires a critical section on nearly every API call.
extern INIVar IgnoreCursorModifications; // Ignore all mouse cursor changes, including hiding/showing the cursor and changing the cursor icon.
extern INIVar EmulateClearsWithDraws; // Makes the driver emulate all Clear() calls (color/Z/stencil) with Draw() calls instead.
extern INIVar IgnoreClearCalls; // Valid options are combinations of 'C' (color), 'Z' (depth), and 'S' (stencil). To ignore all Clear() calls entirely, set "CZS" to skip all three types.
extern INIVar ForceStartFrameClear; // Valid options are combinations of 'C' (color), 'Z' (depth), and 'S' (stencil). Set "CZS" to do all three in a single Clear() call at the start of each frame, or an empty string to do nothing.
extern INIVar LockMaxFramerate; // Valid values are 0 (default), or a framerate (in FPS)
extern INIVar BackgroundMaxFramerate; // Valid values are 0 (unlocked, default), or a framerate (in FPS) to cap the app to when it does not have focus
extern INIVar FrameSkipInterval; // How many frames to render in a row. 1 = "draw every frame", 2 = "draw every other frame", 3 = "draw every third frame", etc. 0 is not a valid value here.
extern INIVar Force16BitDithering; // Is dithering forced on/off/default when rendering to 16-bit render targets?
extern INIVar ForceClipping; // Is clipping forced on/off/default?
extern INIVar AllowUnalignedPitch; // This is a compatability flag that changes the memory layout of locked textures/surfaces to account for games that ignore the Pitch field (always returns a "linear pitch").
extern INIVar ForceTexFilter; // 0 = default, 1 = point, 2 = bilinear, 3 = trilinear, 4 = anisotropic
extern INIVar TrilinearCheatFilterSize; // 0.0 = no cheating (exact spec), 1.0 = 100% cheating (always use bilinear filtering). Usually values close to 1-2% look fine and save on performance.
extern INIVar MaxTextureSize; // Textures larger than this maximum size get automatically shrunk down.
extern INIVar MaxRenderTargetSize; // Render targets larger than this maximum size get clamped to the max size (does not affect backbuffer rendertargets - only render target textures and render target surfaces that are manually-created).
extern INIVar UseLockSafetyBuffers; // Allocate "lock safety buffers" that add extra memory before/after vertexbuffer/indexbuffer or locked surface memory so that games that read/write out of bounds don't cause corruption or crashes.
extern INIVar ForceIdentityViewport; // Force identity viewport (x/y offset = 0, zscale = 1, zoffset = 0, width/height = default for the render target)
extern INIVar ForceIdentityScissorRect; // Force identity scissor rect (top/left = 0, bot/right = render target dimensions)
extern INIVar ForceTexturesA8R8G8B8; // Forces all textures to be in the uncompressed A8R8G8B8 format. The driver will manually decompress textures to this format in software at Unlock() time.
extern INIVar ForceMipmapping; // Is mipmapping forced on/off/default?
extern INIVar ForceStretchRectFilter; // 0 = default, 1 = point, 2 = bilinear
extern INIVar ForceHalfPixelOffset; // Applies a (-0.5f) half-pixel offset to all X/Y vertex coords. 0 = no offset (default), 1 = apply offset to only UP() draw-calls, 2 = apply offset to all draw calls
extern INIVar IgnoreGammaRamp; // Ignores the gamma ramp
extern INIVar IgnoreDirtyRegions; // Determines if the driver should skip (true) tracking dirty regions for all vertexbuffers/indexbuffers/textures/surfaces or not (false).
extern INIVar IgnoreLockFunctionValidation; // Skips validation for bad call arguments for vertexbuffer/indexbuffer/surface Lock() functions if true.
extern INIVar IgnoreDrawFunctionValidation; // Skips validation for bad call arguments for DrawPrimitive/DrawIndexedPrimitive/DrawPrimitiveUP/DrawIndexedPrimitiveUP functions if true.
extern INIVar IgnoreClearFunctionValidation; // Skips validation for bad call arguments for Clear() calls if true.
extern INIVar IgnoreSceneFunctionValidation; // Skips validation for bad call sequences to BeginScene()/EndScene() if true.
extern INIVar IgnorePresentFunctionValidation; // Skips validation for bad call arguments to Present() if true.
extern INIVar DisableDrawCallBatching; // Disables the draw call batching optimization where adjacent draw calls can be combined together into a single draw call.
extern INIVar DisableClearCallBatching; // Disables the clear call batching optimization where adjacent clear calls can be combined together into a single clear call with multiple flags.
extern INIVar DisableStateCaching; // Disables the driver's state caching, so every Draw call will push a full set of state parameters to the GPU every time even if they're the same as last time.
extern INIVar AlwaysValidateDevice; // Skips device validation, always returning D3D_OK.
extern INIVar OverrideDeviceName; // If not empty, overrides the device's queried name with the given string.
extern INIVar OverrideDeviceID; // If not empty, overrides the device's queried ID with the given string.
extern INIVar OverrideDeviceCapsSet; // If not empty, overrides the device's caps bits with those from the given caps set.
extern INIVar EnforceDiscardClearsVertexBuffers; // If true, then DISCARD locks on vertex buffers will forcefully zero the entire buffer.
extern INIVar EnforceDiscardClearsIndexBuffers; // If true, then DISCARD locks on index buffers will forcefully zero the entire buffer.
extern INIVar EnforceDiscardClearsTextures; // If true, then DISCARD locks on dynamic texture surfaces will forcefully zero the entire surface.
