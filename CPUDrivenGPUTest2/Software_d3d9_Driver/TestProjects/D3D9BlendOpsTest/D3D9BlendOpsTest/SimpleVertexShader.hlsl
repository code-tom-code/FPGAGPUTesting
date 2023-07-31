struct vsInput
{
	float3 inPos : POSITION0;
	float2 texCoord : TEXCOORD0;
};

struct vsOutput
{
	float4 oPos : POSITION0;
	float2 texCoord : TEXCOORD0;
	float4 vertColor : COLOR0;
};

vsOutput main(in const vsInput inVert)
{
	vsOutput ret;

	ret.oPos = float4(inVert.inPos, 1.0f);
	ret.texCoord = inVert.texCoord;
	ret.vertColor = float4(1.0f, 1.0f, 1.0f, 1.0f);

	return ret;
}
