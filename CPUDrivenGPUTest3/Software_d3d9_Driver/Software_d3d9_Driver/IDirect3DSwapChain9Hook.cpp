#pragma once

#include "IDirect3DSwapChain9Hook.h"
#include "IDirect3DSurface9Hook.h"
#include "Overlay\DebugOverlay.h"

// Comment out to disable
//#define DUMP_FRAMES_TO_FILE 1

// Comment out to disable
//#define FORCE_CLEAR_REAL_BACKBUFFER 1

/*** IUnknown methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DSwapChain9Hook::QueryInterface(THIS_ REFIID riid, void** ppvObj)
{
	const HRESULT ret = realObject->QueryInterface(riid, ppvObj);
	if (ret == NOERROR)
	{
		*ppvObj = this;
		AddRef();
	}
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DSwapChain9Hook::AddRef(THIS)
{
	const ULONG ret = realObject->AddRef();
	++refCount;
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DSwapChain9Hook::Release(THIS)
{
	const ULONG ret = realObject->Release();
	if (--refCount == 0)
	{
#ifdef DEBUGPRINT_D3DHOOKOBJECT_FULLRELEASES
		char printBuffer[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(printBuffer, "Fully releasing hooked Swap Chain %p\n", this);
#pragma warning(pop)
		OutputDebugStringA(printBuffer);
#endif
		delete this;
	}
	return ret;
}

/*** IDirect3DSwapChain9 methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DSwapChain9Hook::Present(THIS_ CONST RECT* pSourceRect,CONST RECT* pDestRect,HWND hDestWindowOverride,CONST RGNDATA* pDirtyRegion,DWORD dwFlags)
{
	SIMPLE_FUNC_SCOPE();

	// Only allow source rects the same size as the backbuffer:
	if (pSourceRect)
	{
		if (pSourceRect->left != 0)
		{
			__debugbreak();
		}
		if (pSourceRect->top != 0)
		{
			__debugbreak();
		}
		if (pSourceRect->right != InternalPresentParameters.BackBufferWidth)
		{
			__debugbreak();
		}
		if (pSourceRect->bottom != InternalPresentParameters.BackBufferHeight)
		{
			__debugbreak();
		}
	}

	// Only allow dest rects the same size as the backbuffer:
	if (pDestRect)
	{
		if (pDestRect->left != 0)
		{
			__debugbreak();
		}
		if (pDestRect->top != 0)
		{
			__debugbreak();
		}
		if (pDestRect->right != InternalPresentParameters.BackBufferWidth)
		{
			__debugbreak();
		}
		if (pDestRect->bottom != InternalPresentParameters.BackBufferHeight)
		{
			__debugbreak();
		}
	}

	if (pSourceRect && pDestRect)
	{
		// We don't currently support disjoint source/dest rects
		if (memcmp(pSourceRect, pDestRect, sizeof(RECT) ) != 0)
		{
			__debugbreak();
		}
	}

	if (pDirtyRegion)
	{
		// Dirty Regions are not yet supported by the virtual software renderer
		__debugbreak();
	}

	// Flush the ROP's to the back buffer in case they have outstanding writes in their caches
	parentDevice->GetBaseDevice()->DeviceFlushROPCache();

	// Request a full pipeline flush wait on each present so that the CPU doesn't get ahead of the GPU (optional VSync wait here also)
	if (parentDevice->GetEnableVSyncWait() )
		parentDevice->GetBaseDevice()->DeviceWaitForIdle(waitForDeviceIdleCommand::waitForFullPipelineFlushAndVSync, true);
	else
		parentDevice->GetBaseDevice()->DeviceWaitForIdle(waitForDeviceIdleCommand::waitForFullPipelineFlush, true);

	// Swap our buffers if double-buffering is enabled (otherwise, just keep rendering and presenting from the one buffer)
	const IDirect3DSurface9Hook* newScanoutBuffer = backBuffer;
	if (parentDevice->GetUseDoubleBuffering() )
	{
		frontBuffer->FrontbufferBackbufferSwap(backBuffer);
		newScanoutBuffer = frontBuffer;
	}
	parentDevice->GetBaseDevice()->DeviceSetScanoutBuffer(newScanoutBuffer->GetDeviceSurfaceBytes(), parentDevice->GetScanoutEnabled(), parentDevice->GetInvertScanoutColors(), parentDevice->GetScanoutSwizzleR(), 
		parentDevice->GetScanoutSwizzleG(), parentDevice->GetScanoutSwizzleB() );

	// Don't download stats every frame since pulling them is relatively expensive over serial UART and it will affect total frame-times:
	if (parentDevice->DoEnableGPUStats() )
	{
		// This implicitly calls DeviceEndFrame() internally so we don't need to call it twice
		parentDevice->GetDeviceStats().DownloadEndOfFrameStats(parentDevice->GetBaseDevice() );
	}
	else if (parentDevice->GetDeviceStats().IsCollectingEventDataThisFrame() )
	{
		parentDevice->GetDeviceStats().FinishDownloadingEndOfFrameEvents(parentDevice->GetBaseDevice() );
		parentDevice->GetDeviceStats().FlipRecordedDrawEventsToStats(parentDevice->GetEventRecordedDrawEvents() );
		parentDevice->GetDeviceStats().ProcessDrawEventsData();
	}
	else if (parentDevice->GetDeviceStats().IsArmedForEventCollectionNextFrame() )
	{
		parentDevice->GetBaseDevice()->DeviceEndFrameAndQueueEventRecording(parentDevice->GetDeviceStats().GetEventTimestampsBuffer(), parentDevice->GetDeviceStats().GetEventsOrderBuffer() );
		parentDevice->GetDeviceStats().CollectEventDataThisFrame();
	}
	else // Regular frame
	{
		// Ends the frame, causing the command processor to clear all of the state blocks and reset its draw calls counter
		parentDevice->GetBaseDevice()->DeviceEndFrame();
	}

	// Make sure to wipe our end-of-frame draw events list so that it doesn't grow forever and eat up infinite memory
	parentDevice->GetEventRecordedDrawEvents().clear();

	UpdateOverlay(parentDevice);

	// Blit from the software backbuffer to the hardware backbuffer:
	if (parentDevice->GetEnableSoftwareRenderingVisualization() )
	{
		InternalBlit();
	}

#ifdef DUMP_FRAMES_TO_FILE
	{
		char filenameBuffer[256] = {0};
		static unsigned frameNumber = 0;
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(filenameBuffer, "frame%u.bmp", frameNumber++ % 32);
#pragma warning(pop)
		D3DXSaveSurfaceToFileA(filenameBuffer, D3DXIFF_BMP, tempBlitSurface, NULL, NULL);
	}
#endif

	HRESULT ret;
	{
		SIMPLE_NAME_SCOPE("Real Device Present");
		ret = realObject->Present(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion, dwFlags);
	}
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DSwapChain9Hook::GetFrontBufferData(THIS_ IDirect3DSurface9* pDestSurface)
{
	const IDirect3DSurface9Hook* const hookPtr = dynamic_cast<IDirect3DSurface9Hook* const>(pDestSurface);
	if (hookPtr)
		pDestSurface = hookPtr->GetUnderlyingSurface();
#ifdef _DEBUG
	else if (pDestSurface != NULL)
	{
		DbgBreakPrint("Error: GetFrontBufferData called with a non-hooked surface pointer");
	}
#endif
	const HRESULT ret = realObject->GetFrontBufferData(hookPtr ? hookPtr->GetUnderlyingSurface() : NULL);
	if (SUCCEEDED(ret) )
	{
		// TODO: Implement this...
	}
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DSwapChain9Hook::GetBackBuffer(THIS_ UINT iBackBuffer,D3DBACKBUFFER_TYPE Type,IDirect3DSurface9** ppBackBuffer)
{
	const HRESULT ret = realObject->GetBackBuffer(iBackBuffer, Type, ppBackBuffer);
	if (FAILED(ret) )
		return ret;

	if (ppBackBuffer)
	{
		if (iBackBuffer == 0 && Type == D3DBACKBUFFER_TYPE_MONO)
		{
#ifdef _DEBUG
			if (*ppBackBuffer != backBuffer->GetUnderlyingSurface() )
			{
				__debugbreak();
			}
#endif
			*ppBackBuffer = backBuffer;
			backBuffer->AddRef();
		}
		else
		{
			if (iBackBuffer != 0)
			{
				// Multiple back-buffers per swap-chain not yet supported
				__debugbreak();
			}
			else if (Type != D3DBACKBUFFER_TYPE_MONO)
			{
				// Stereo back-buffers are not supported yet!
				__debugbreak();
			}
			else
			{
				// Not sure how we got here!
				__debugbreak();
			}
		}
	}
	else
	{
		__debugbreak();
	}

	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DSwapChain9Hook::GetRasterStatus(THIS_ D3DRASTER_STATUS* pRasterStatus)
{
	const HRESULT ret = realObject->GetRasterStatus(pRasterStatus);
	// TODO: Implement this...
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DSwapChain9Hook::GetDisplayMode(THIS_ D3DDISPLAYMODE* pMode)
{
	const HRESULT ret = realObject->GetDisplayMode(pMode);
	if (FAILED(ret) )
		return ret;

#ifdef _DEBUG
	if (pMode)
	{
		// TODO: Implement this...
		/*if (memcmp(pMode, &InternalDisplayMode, sizeof(D3DDISPLAYMODE) ) != 0)
		{
			__debugbreak();
		}*/
	}
#endif

	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DSwapChain9Hook::GetDevice(THIS_ IDirect3DDevice9** ppDevice)
{
	LPDIRECT3DDEVICE9 realD3D9dev = NULL;
	const HRESULT ret = realObject->GetDevice(&realD3D9dev);
	if (FAILED(ret) )
	{
		*ppDevice = NULL;
		return ret;
	}

	// Check that the parentHook's underlying IDirect3DDevice9* matches the realD3D9dev pointer
	if (parentDevice->GetUnderlyingDevice() != realD3D9dev)
	{
		DbgBreakPrint("Error: Unknown d3d9 device hook detected!");
	}
	parentDevice->AddRef(); // Super important to increment the ref-count here, otherwise our parent object will get destroyed when Release() is called on it!

	*ppDevice = parentDevice;
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DSwapChain9Hook::GetPresentParameters(THIS_ D3DPRESENT_PARAMETERS* pPresentationParameters)
{
	const HRESULT ret = realObject->GetPresentParameters(pPresentationParameters);
	if (FAILED(ret) )
		return ret;

#ifdef _DEBUG
	if (pPresentationParameters)
	{
		if (memcmp(pPresentationParameters, &InternalPresentParameters, sizeof(D3DPRESENT_PARAMETERS) ) != 0)
		{
			__debugbreak();
		}
	}
#endif

	return ret;
}

void IDirect3DSwapChain9Hook::InitializeSwapChain(const D3DPRESENT_PARAMETERS& _PresentParameters, IDirect3DSurface9Hook* swapChainBackBuffer)
{
	InternalPresentParameters = _PresentParameters;

	D3DDISPLAYMODE localDisplayMode = {0};
	localDisplayMode.Width = InternalPresentParameters.BackBufferWidth;
	localDisplayMode.Height = InternalPresentParameters.BackBufferHeight;

	// TODO: Don't hardcode to 60Hz
	static const unsigned defaultRefreshRate = 60;
	localDisplayMode.RefreshRate = InternalPresentParameters.Windowed ? defaultRefreshRate : InternalPresentParameters.FullScreen_RefreshRateInHz;
	localDisplayMode.Format = InternalPresentParameters.BackBufferFormat;

	InternalDisplayMode = localDisplayMode;

#ifdef _DEBUG
	if (!swapChainBackBuffer)
	{
		// We have to have a back buffer!
		__debugbreak();
	}
#endif

	// Create the other buffer for use with double-buffering:
	backBuffer = swapChainBackBuffer;
	frontBuffer = new IDirect3DSurface9Hook(NULL, parentDevice);
	frontBuffer->CreateDeviceImplicitFrontbufferSurface(InternalPresentParameters);

	// Initialize our blitting surface, which is how we'll be uploading the software-rasterized backbuffers to the GPU for display
	InitBlitSurface();
}

void IDirect3DSwapChain9Hook::SetGammaRamp(DWORD Flags, CONST D3DGAMMARAMP* pRamp)
{
	UNREFERENCED_PARAMETER(Flags);

	if (pRamp)
	{
		gammaRamp = *pRamp;
	}
#ifdef _DEBUG
	else
	{
		__debugbreak();
	}
#endif
}

void IDirect3DSwapChain9Hook::GetGammaRamp(D3DGAMMARAMP* pRamp)
{
	if (pRamp)
	{
		*pRamp = gammaRamp;
	}
#ifdef _DEBUG
	else
	{
		__debugbreak();
	}
#endif
}

void IDirect3DSwapChain9Hook::InitDefaultGammaRamp(void)
{
	for (WORD x = 0; x < 256; ++x)
	{
		gammaRamp.red[x] = gammaRamp.green[x] = gammaRamp.blue[x] = x;
	}
}

void IDirect3DSwapChain9Hook::InitBlitSurface(void)
{
	LPDIRECT3DDEVICE9 rawDevice = parentDevice->GetUnderlyingDevice();
	if (FAILED(rawDevice->CreateOffscreenPlainSurface(InternalDisplayMode.Width, InternalDisplayMode.Height, InternalDisplayMode.Format, D3DPOOL_SYSTEMMEM, &tempBlitSurface, NULL) ) || !tempBlitSurface)
	{
		// This should never happen unless we are all out of memory!
		__debugbreak();
	}
}

// Blit from the software backbuffer to the hardware backbuffer:
void IDirect3DSwapChain9Hook::InternalBlit(void)
{
	SIMPLE_FUNC_SCOPE();

	LPDIRECT3DDEVICE9 rawDevice = parentDevice->GetUnderlyingDevice();
	LPDIRECT3DSURFACE9 rawBackBuffer = NULL;
	rawDevice->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &rawBackBuffer);
	D3DLOCKED_RECT d3dlr = {0};
	const BYTE* const surfaceBytesRaw = backBuffer->GetSurfaceBytesRaw();
	if (FAILED(tempBlitSurface->LockRect(&d3dlr, NULL, 0) ) || !d3dlr.pBits)
	{
#ifdef _DEBUG
		__debugbreak(); // Failed lock!
#endif
		return;
	}
#ifdef _DEBUG
	if (d3dlr.Pitch != sizeof(D3DCOLOR) * InternalDisplayMode.Width)
	{
		// Unexpected surface pitch, memcpy can't handle unaligned pitches
		__debugbreak();
	}
#endif
	
	{
		SIMPLE_NAME_SCOPE("Blit Memcpy");
		memcpy(d3dlr.pBits, surfaceBytesRaw, backBuffer->GetInternalWidth() * backBuffer->GetInternalHeight() * sizeof(D3DCOLOR) );
	}

	tempBlitSurface->UnlockRect();

#ifdef FORCE_CLEAR_REAL_BACKBUFFER
	rawDevice->SetRenderTarget(0, rawBackBuffer);
	rawDevice->Clear(0, NULL, D3DCLEAR_TARGET, D3DCOLOR_ARGB(0, 0, 0, 0), 1.0f, 0x00000000);
#endif

	rawDevice->UpdateSurface(tempBlitSurface, NULL, rawBackBuffer, NULL);
	rawBackBuffer->Release();
	rawBackBuffer = NULL;
}
