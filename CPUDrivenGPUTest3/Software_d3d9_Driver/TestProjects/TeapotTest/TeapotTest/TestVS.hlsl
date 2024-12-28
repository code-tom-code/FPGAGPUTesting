const row_major float4x4 wvp : register(c0);
const row_major float4x4 wv : register(c4);

struct inVert
{
	float3 pos : POSITION0;
	float3 normal : NORMAL0;
	float2 texcoord : TEXCOORD0;
};

struct outVert
{
	float4 posRhw : POSITION0;
	float4 color : COLOR0;
	float2 texcoord : TEXCOORD0;
};

static const float3 lightDir = normalize(float3(0.1f, -1.0f, -0.1f) );

outVert main(in const inVert input)
{
	outVert ret;

	ret.posRhw = mul(float4(input.pos, 1.0f), wvp);
	//ret.color = float4(0.0f, 1.0f, 0.0f, 1.0f);
	ret.color.g = saturate(dot(-lightDir, mul(float4(input.normal, 0.0f), wv).xyz) );
	//ret.color.rgb = 1.0f;
	ret.color.rb = ret.color.g;
	ret.color.a = 1.0f;
	ret.texcoord = input.texcoord;
	//ret.posRhw.w = 4.0f;

	return ret;
}
