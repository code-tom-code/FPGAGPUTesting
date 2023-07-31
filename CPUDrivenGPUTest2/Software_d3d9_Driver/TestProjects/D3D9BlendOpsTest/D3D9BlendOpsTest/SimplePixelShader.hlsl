sampler2D tex : register(s0);

struct vsOutput
{
	float2 texCoord : TEXCOORD0;
	float4 vertColor : COLOR0;
};

float4 main(in const vsOutput psInput) : COLOR0
{
	return tex2D(tex, psInput.texCoord) * psInput.vertColor;
}
