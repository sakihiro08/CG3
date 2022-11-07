#include"BasicShaderHeader.hlsli"
//シ角形の頂点
static const uint vnum = 4;
//センターからの
static const float4 offset_array[vnum] =
{
	float4(-0.5f,-0.5f,0,0),
	float4(-0.5f,+0.5f,0,0),
	float4(+0.5f,-0.5f,0,0),
	float4(+0.5f,+0.5f,0,0),
};
static const float2 uv_array[vnum] =
{
	float2(0,1),
	float2(0,0),
	float2(1,1),
	float2(1,0),
};
[maxvertexcount(vnum)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element;
	for (uint i = 0; i < vnum; i++)
	{
		element.svpos = input[0].pos + offset_array[i];
		element.svpos = mul(mat, element.svpos);
		/*element.uv = float2(0.5f, 0.5f);*/
		element.uv = uv_array[i];
		output.Append(element);
	}
};

//		//共通
//		/*element.pos = input[0].svpos;*/
//		element.normal = input[0].normal;
//		element.uv = input[0].uv;
//		//1点目
//		element.svpos = input[0].svpos;
//		output.Append(element);
//		//2点目
//		element.svpos = input[0].svpos+float4(10.0f,10.0f,0,0);
//		output.Append(element);
//		//3点目
//		element.svpos = input[0].svpos + float4(10.0f, 0, 0, 0);
//		output.Append(element);
//	
//	/*output.RestartStrip();
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;
//		element.pos = input[i].svpos+float4(20.0f,0.0f,0.0f,0.0f);
//		element.normal = input[i].normal;
//		element.uv = input[i].uv * 5.0f;
//		output.Append(element);
//	}*/
//}