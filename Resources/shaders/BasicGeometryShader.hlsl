#include"BasicShaderHeader.hlsli"

[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
   {
		GSOutput element;
		//‹¤’Ê
		/*element.pos = input[0].svpos;*/
		element.normal = input[0].normal;
		element.uv = input[0].uv;
		//1“_–Ú
		element.svpos = input[0].svpos;
		output.Append(element);
		//2“_–Ú
		element.svpos = input[0].svpos+float4(10.0f,10.0f,0,0);
		output.Append(element);
		//3“_–Ú
		element.svpos = input[0].svpos + float4(10.0f, 0, 0, 0);
		output.Append(element);
	
	/*output.RestartStrip();
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		element.pos = input[i].svpos+float4(20.0f,0.0f,0.0f,0.0f);
		element.normal = input[i].normal;
		element.uv = input[i].uv * 5.0f;
		output.Append(element);
	}*/
}