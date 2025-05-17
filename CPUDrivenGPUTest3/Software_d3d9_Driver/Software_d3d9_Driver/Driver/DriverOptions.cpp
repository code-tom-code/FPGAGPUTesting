#include "DriverOptions.h"

INIVar ForceWindowedMode("Options", "ForceWindowedMode", DFO_AppDefault); // Forces Windowed mode, Fullscreen mode, or AppDefault
INIVar ForceBackbufferColorDepth("Options", "ForceBackbufferColorDepth", 0u); // Valid values are 0 (default), 8, 16, 24, or 32
INIVar ForceRefreshRate("Options", "ForceRefreshRate", 0u); // Valid values are 0 (default), or a refresh rate integer
INIVar ForceBackbufferWidth("Options", "ForceBackbufferWidth", 0u); // Valid values are 0 (default), or a backbuffer width, in pixels (for example: 640)
INIVar ForceBackbufferHeight("Options", "ForceBackbufferHeight", 0u); // Valid values are 0 (default), or a backbuffer height, in pixels (for example: 480)
INIVar ForceVSync("Options", "ForceVSync", DFO_AppDefault); // Forces VSync on (enabled), off (disabled), or AppDefault
INIVar EmulateSWVP("Options", "EmulateSWVP", DFO_AppDefault); // Forces the driver to run vertex shaders in software to emulate what the device does, then submits all pretransformed triangles to the GPU for rasterization
INIVar ForceMultithreaded("Options", "ForceMultithreaded", DFO_AppDefault); // Force D3DCREATE_MULTITHREADED (for games that were designed for single-threaded CPU's but that now have to run on multi-threaded ones). The flag acquires a critical section on nearly every API call.
INIVar IgnoreCursorModifications("Options", "IgnoreCursorModifications", false); // Ignore all mouse cursor changes, including hiding/showing the cursor and changing the cursor icon.
INIVar EmulateClearsWithDraws("Options", "EmulateClearsWithDraws", DFO_AppDefault); // Makes the driver emulate all Clear() calls (color/Z/stencil) with Draw() calls instead.
INIVar IgnoreClearCalls("Options", "IgnoreClearCalls", ""); // Valid options are combinations of 'C' (color), 'Z' (depth), and 'S' (stencil). To ignore all Clear() calls entirely, set "CZS" to skip all three types.
INIVar ForceStartFrameClear("Options", "ForceStartFrameClear", ""); // Valid options are combinations of 'C' (color), 'Z' (depth), and 'S' (stencil). Set "CZS" to do all three in a single Clear() call at the start of each frame, or an empty string to do nothing.
INIVar LockMaxFramerate("Options", "LockMaxFramerate", 0u); // Valid values are 0 (default), or a framerate (in FPS)
INIVar BackgroundMaxFramerate("Options", "BackgroundMaxFramerate", 0u); // Valid values are 0 (unlocked, default), or a framerate (in FPS) to cap the app to when it does not have focus
INIVar FrameSkipInterval("Options", "FrameSkipInterval", 1u); // How many frames to render in a row. 1 = "draw every frame", 2 = "draw every other frame", 3 = "draw every third frame", etc. 0 is not a valid value here.
INIVar Force16BitDithering("Options", "Force16BitDithering", DFO_AppDefault); // Is dithering forced on/off/default when rendering to 16-bit render targets?
INIVar ForceClipping("Options", "ForceClipping", DFO_AppDefault); // Is clipping forced on/off/default?
INIVar AllowUnalignedPitch("Options", "AllowUnalignedPitch", false); // This is a compatability flag that changes the memory layout of locked textures/surfaces to account for games that ignore the Pitch field (always returns a "linear pitch").
INIVar ForceTexFilter("Options", "ForceTexFilter", 0u); // 0 = default, 1 = point, 2 = bilinear, 3 = trilinear, 4 = anisotropic
INIVar TrilinearCheatFilterSize("Options", "TrilinearCheatFilterSize", 0.015f); // 0.0 = no cheating (exact spec), 1.0 = 100% cheating (always use bilinear filtering). Usually values close to 1-2% look fine and save on performance.
INIVar MaxTextureSize("Options", "MaxTextureSize", 128u); // Textures larger than this maximum size get automatically shrunk down.
INIVar MaxRenderTargetSize("Options", "MaxRenderTargetSize", 512u); // Render targets larger than this maximum size get clamped to the max size (does not affect backbuffer rendertargets - only render target textures and render target surfaces that are manually-created).
INIVar UseLockSafetyBuffers("Options", "UseLockSafetyBuffers", false); // Allocate "lock safety buffers" that add extra memory before/after vertexbuffer/indexbuffer or locked surface memory so that games that read/write out of bounds don't cause corruption or crashes.
INIVar ForceIdentityViewport("Options", "ForceIdentityViewport", false); // Force identity viewport (x/y offset = 0, zscale = 1, zoffset = 0, width/height = default for the render target)
INIVar ForceIdentityScissorRect("Options", "ForceIdentityScissorRect", false); // Force identity scissor rect (top/left = 0, bot/right = render target dimensions)
INIVar ForceTexturesA8R8G8B8("Options", "ForceTexturesA8R8G8B8", false); // Forces all textures to be in the uncompressed A8R8G8B8 format. The driver will manually decompress textures to this format in software at Unlock() time.
INIVar ForceMipmapping("Options", "ForceMipmapping", DFO_AppDefault); // Is mipmapping forced on/off/default?
INIVar ForceStretchRectFilter("Options", "ForceStretchRectFilter", 0u); // 0 = default, 1 = point, 2 = bilinear
INIVar ForceHalfPixelOffset("Options", "ForceHalfPixelOffset", 0u); // Applies a (-0.5f) half-pixel offset to all X/Y vertex coords. 0 = no offset (default), 1 = apply offset to only UP() draw-calls, 2 = apply offset to all draw calls
INIVar IgnoreGammaRamp("Options", "IgnoreGammaRamp", false); // Ignores the gamma ramp
INIVar IgnoreDirtyRegions("Options", "IgnoreDirtyRegions", false); // Determines if the driver should skip (true) tracking dirty regions for all vertexbuffers/indexbuffers/textures/surfaces or not (false).
INIVar IgnoreLockFunctionValidation("Options", "IgnoreLockFunctionValidation", false); // Skips validation for bad call arguments for vertexbuffer/indexbuffer/surface Lock() functions if true.
INIVar IgnoreDrawFunctionValidation("Options", "IgnoreDrawFunctionValidation", false); // Skips validation for bad call arguments for DrawPrimitive/DrawIndexedPrimitive/DrawPrimitiveUP/DrawIndexedPrimitiveUP functions if true.
INIVar IgnoreClearFunctionValidation("Options", "IgnoreClearFunctionValidation", false); // Skips validation for bad call arguments for Clear() calls if true.
INIVar IgnoreSceneFunctionValidation("Options", "IgnoreSceneFunctionValidation", false); // Skips validation for bad call sequences to BeginScene()/EndScene() if true.
INIVar IgnorePresentFunctionValidation("Options", "IgnorePresentFunctionValidation", false); // Skips validation for bad call arguments to Present() if true.
INIVar DisableDrawCallBatching("Options", "DisableDrawCallBatching", false); // Disables the draw call batching optimization where adjacent draw calls can be combined together into a single draw call.
INIVar DisableClearCallBatching("Options", "DisableClearCallBatching", false); // Disables the clear call batching optimization where adjacent clear calls can be combined together into a single clear call with multiple flags.
INIVar DisableStateCaching("Options", "DisableStateCaching", false); // Disables the driver's state caching, so every Draw call will push a full set of state parameters to the GPU every time even if they're the same as last time.
INIVar AlwaysValidateDevice("Options", "AlwaysValidateDevice", false); // Skips device validation, always returning D3D_OK.
INIVar OverrideDeviceName("Options", "OverrideDeviceName", ""); // If not empty, overrides the device's queried name with the given string.
INIVar OverrideDeviceID("Options", "OverrideDeviceID", ""); // If not empty, overrides the device's queried ID with the given string.
INIVar OverrideDeviceCapsSet("Options", "OverrideDeviceCapsSet", ""); // If not empty, overrides the device's caps bits with those from the given caps set.
INIVar EnforceDiscardClearsVertexBuffers("Options", "EnforceDiscardClearsVertexBuffers", false); // If true, then DISCARD locks on vertex buffers will forcefully zero the entire buffer.
INIVar EnforceDiscardClearsIndexBuffers("Options", "EnforceDiscardClearsIndexBuffers", false); // If true, then DISCARD locks on index buffers will forcefully zero the entire buffer.
INIVar EnforceDiscardClearsTextures("Options", "EnforceDiscardClearsTextures", false); // If true, then DISCARD locks on dynamic texture surfaces will forcefully zero the entire surface.
