struct inVert
{
	float3 inPos : POSITION0;
	float4 diffuse : COLOR0;
	float2 texCoord : TEXCOORD0;
};

struct outVert
{
	float4 outPos : POSITION0;
	float4 diffuse : COLOR0;
	float2 texCoord : TEXCOORD0;
};

outVert main(in const inVert inputV)
{
	outVert ret;

	ret.outPos = float4(inputV.inPos, 1.0f);
	ret.diffuse = inputV.diffuse;
	ret.texCoord = inputV.texCoord;

	return ret;
}
