#include "IBaseDeviceComms.h"
#include "PacketDefs.h"
#include <stdio.h>
#include <vector>
#include "GPUAllocator.h"
#include "GPUReturnTracker.h"

/*static*/ IBaseDeviceComms* IBaseDeviceComms::globalDeviceComms = NULL;


