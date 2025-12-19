struct PSInput
{
	float4 color : COLOR0;
	nointerpolation float2 texcoord : BLENDINDICES0;
};

float4 main(PSInput input) : COLOR0
{
	return float4(frac(input.texcoord).xx, 0.0f, 1.0f);
}
