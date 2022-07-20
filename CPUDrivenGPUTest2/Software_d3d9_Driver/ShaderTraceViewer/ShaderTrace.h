#pragma once

#include "..\Software_d3d9_Driver\Driver\GPUDeviceLimits.h"

struct DeviceRegisterFile
{
	union floatIntUnion
	{
		float f;
		unsigned long u;
		signed long i;
	};

	struct deviceRegFloat4
	{
		float x, y, z, w;
	};

	union _regFileUnion
	{
		struct _DeviceWriteOrder
		{
			struct perRegType
			{
				struct perRegIndex
				{
					struct perReadQuad
					{
						struct perChannel
						{
							floatIntUnion a, b, c, d; // This is lane a, b, c, and d for this register quad/type/index/channel
						} channels[4];
					} gprQuad[4];
				} regIndices[GPU_SHADER_MAX_NUM_GPR_REG];
			} regTypes[GPU_SHADER_NUM_REGFILE_TYPES];
		} DeviceWriteOrder;

		struct _LogicalOrder
		{
			struct perLane
			{
				struct perRegType
				{
					struct perRegIndex
					{
						floatIntUnion x, y, z, w; // These are x, y, z, w channels for this register
					} regIndices[GPU_SHADER_MAX_NUM_GPR_REG];
				} regTypes[GPU_SHADER_NUM_REGFILE_TYPES];
			} lanes[GPU_SHADER_NUM_LANES];
		} LogicalOrder;
	} regFileUnion;

	void SwizzleDeviceWriteOrderToLogicalOrder()
	{
		DeviceRegisterFile newOrder;

		//const deviceRegFloat4* floatPtr = (const deviceRegFloat4* const)&regFileUnion.DeviceWriteOrder;
		const float* floatPtr = (const float* const)&regFileUnion.DeviceWriteOrder;
		unsigned regFileType = 0;
		unsigned regIndex = 0;
		unsigned readQuad = 0;
		unsigned channel = 0;

		/*while (true)
		{
			for (unsigned waveLaneID = 0; waveLaneID < 4; ++waveLaneID)
			{
				float thisFloat = 0.0f;
				switch (waveLaneID)
				{
				case 0:
					thisFloat = floatPtr->x;
					break;
				case 1:
					thisFloat = floatPtr->y;
					break;
				case 2:
					thisFloat = floatPtr->z;
					break;
				case 3:
					thisFloat = floatPtr->w;
					break;
				}
				switch (channel)
				{
				case 0:
					newOrder.regFileUnion.LogicalOrder.lanes[(readQuad * 4) + waveLaneID].regTypes[regFileType].regIndices[regIndex].x.f = thisFloat;
					break;
				case 1:
					newOrder.regFileUnion.LogicalOrder.lanes[(readQuad * 4) + waveLaneID].regTypes[regFileType].regIndices[regIndex].y.f = thisFloat;
					break;
				case 2:
					newOrder.regFileUnion.LogicalOrder.lanes[(readQuad * 4) + waveLaneID].regTypes[regFileType].regIndices[regIndex].z.f = thisFloat;
					break;
				case 3:
					newOrder.regFileUnion.LogicalOrder.lanes[(readQuad * 4) + waveLaneID].regTypes[regFileType].regIndices[regIndex].w.f = thisFloat;
					break;
				}
			}

			++floatPtr;

			if (channel == 3)
			{
				channel = 0;
				if (readQuad == 3)
				{
					readQuad = 0;
					if (regIndex == 7)
					{
						regIndex = 0;
						if (regFileType == 3)
						{
							regFileType = 0;
							break;
						}
						else
						{
							++regFileType;
						}
					}
					else
					{
						++regIndex;
					}
				}
				else
				{
					++readQuad;
				}
			}
			else
			{
				++channel;
			}
		};*/


		for (unsigned regFileType = 0; regFileType < GPU_SHADER_NUM_REGFILE_TYPES; ++regFileType)
		{
			for (unsigned regIndex = 0; regIndex < GPU_SHADER_MAX_NUM_GPR_REG; ++regIndex)
			{
				for (unsigned readQuad = 0; readQuad < 4; ++readQuad)
				{
					for (unsigned channel = 0; channel < 4; ++channel)
					{
						for (unsigned waveLSB = 0; waveLSB < 4; ++waveLSB)
						{
							switch (channel)
							{
							case 0:
								newOrder.regFileUnion.LogicalOrder.lanes[(readQuad * 4) + waveLSB].regTypes[regFileType].regIndices[regIndex].x.f = *floatPtr++;
								break;
							case 1:
								newOrder.regFileUnion.LogicalOrder.lanes[(readQuad * 4) + waveLSB].regTypes[regFileType].regIndices[regIndex].y.f = *floatPtr++;
								break;
							case 2:
								newOrder.regFileUnion.LogicalOrder.lanes[(readQuad * 4) + waveLSB].regTypes[regFileType].regIndices[regIndex].z.f = *floatPtr++;
								break;
							case 3:
								newOrder.regFileUnion.LogicalOrder.lanes[(readQuad * 4) + waveLSB].regTypes[regFileType].regIndices[regIndex].w.f = *floatPtr++;
								break;
							}
						}
					}
				}
			}
		}

		/*for (unsigned laneID = 0; laneID < GPU_SHADER_NUM_LANES; ++laneID)
		{
			for (unsigned regFileType = 0; regFileType < GPU_SHADER_NUM_REGFILE_TYPES; ++regFileType)
			{
				for (unsigned regIndex = 0; regIndex < GPU_SHADER_MAX_NUM_GPR_REG; ++regIndex)
				{
					for (unsigned channel = 0; channel < 4; ++channel)
					{
						const floatIntUnion* readReg = NULL;
						const unsigned readGPRQuad = laneID >> 2;
						const unsigned readRegOffset = laneID & 0x3;
						switch (readRegOffset)
						{
						case 0:
							readReg = &(regFileUnion.DeviceWriteOrder.regTypes[regFileType].regIndices[regIndex].gprQuad[readGPRQuad].channels[channel].a);
							break;
						case 1:
							readReg = &(regFileUnion.DeviceWriteOrder.regTypes[regFileType].regIndices[regIndex].gprQuad[readGPRQuad].channels[channel].b);
							break;
						case 2:
							readReg = &(regFileUnion.DeviceWriteOrder.regTypes[regFileType].regIndices[regIndex].gprQuad[readGPRQuad].channels[channel].c);
							break;
						case 3:
							readReg = &(regFileUnion.DeviceWriteOrder.regTypes[regFileType].regIndices[regIndex].gprQuad[readGPRQuad].channels[channel].d);
							break;
						}

						floatIntUnion* writeReg = NULL;
						switch (channel)
						{
						case 0:
							writeReg = &(newOrder.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regFileType].regIndices[regIndex].x);
							break;
						case 1:
							writeReg = &(newOrder.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regFileType].regIndices[regIndex].y);
							break;
						case 2:
							writeReg = &(newOrder.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regFileType].regIndices[regIndex].z);
							break;
						case 3:
							writeReg = &(newOrder.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regFileType].regIndices[regIndex].w);
							break;
						}

						*writeReg = *readReg;
					}
				}
			}
		}*/

		*this = newOrder;
	}
};
static_assert(sizeof(DeviceRegisterFile::_regFileUnion::DeviceWriteOrder) == sizeof(DeviceRegisterFile::_regFileUnion::LogicalOrder), "Error: Unexpected union size difference!");
static_assert(sizeof(DeviceRegisterFile) == GPU_SHADER_NUM_LANES * GPU_SHADER_NUM_REGFILE_TYPES * GPU_SHADER_MAX_NUM_GPR_REG * sizeof(DeviceRegisterFile::deviceRegFloat4), "Error: Unexpected struct size!");