// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Custom/PostEffect"
{
	Properties
	{
		_MainTex("Main Texture", 2D) = "white" {}
		_XSpeed("XSpeed", Float) = 1
		_YSpeed("YSpeed", Float) = 1
		_XFreq("XFreq", Float) = 10
		_YFreq("YFreq", Float) = 10
		_XInte("XInte", Float) = 1
		_YInte("YInte", Float) = 1
		_Desat("Desat", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Overlay+0" "IsEmissive" = "true"  }
		Cull Off
		ZWrite Off
		ZTest Always
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 5.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 screenPos;
		};

		uniform sampler2D _MainTex;
		uniform float _YSpeed;
		uniform float _YFreq;
		uniform float _YInte;
		uniform float _XFreq;
		uniform float _XSpeed;
		uniform float _XInte;
		uniform float _Desat;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float mulTime35 = _Time.y * _YSpeed;
			float mulTime25 = _Time.y * _XSpeed;
			float3 desaturateInitialColor47 = tex2D( _MainTex, ( ase_screenPosNorm + float4( ( ( sin( ( ( ase_screenPosNorm.x + mulTime35 ) * _YFreq ) ) * float2( 0,1 ) * _YInte ) + ( sin( ( _XFreq * ( ase_screenPosNorm.y + mulTime25 ) ) ) * float2( 1,0 ) * _XInte ) ), 0.0 , 0.0 ) ).xy ).rgb;
			float desaturateDot47 = dot( desaturateInitialColor47, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar47 = lerp( desaturateInitialColor47, desaturateDot47.xxx, _Desat );
			o.Emission = desaturateVar47;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18935
263;159;1731;917;1694.326;269.2758;1;True;True
Node;AmplifyShaderEditor.RangedFloatNode;24;-1445.426,243.1243;Inherit;False;Property;_XSpeed;XSpeed;2;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1445.426,169.1242;Inherit;False;Property;_YSpeed;YSpeed;3;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;26;-1299.426,23.12422;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;35;-1305.426,187.1242;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;25;-1303.426,255.1243;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;46;-1083.426,113.1242;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;45;-1086.426,22.12424;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-1110.426,-47.87578;Inherit;False;Property;_XFreq;XFreq;4;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-1085.426,201.1242;Inherit;False;Property;_YFreq;YFreq;5;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-930.4261,51.12424;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-932.4261,146.1242;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;38;-1063.426,400.1243;Inherit;False;Constant;_Green;Green;6;0;Create;True;0;0;0;False;0;False;0,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SinOpNode;28;-808.4261,260.1243;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;37;-1066.426,287.1243;Inherit;False;Constant;_Red;Red;6;0;Create;True;0;0;0;False;0;False;1,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;43;-646.4261,240.1242;Inherit;False;Property;_XInte;XInte;6;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-639.4261,-16.87578;Inherit;False;Property;_YInte;YInte;7;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;23;-807.4261,52.12424;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-504.4261,63.12424;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-503.4261,179.1242;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;44;-358.4261,65.12424;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;13;-317.4263,-163.0758;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;11;-112.4263,-157.0758;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;17;5.573914,-157.6758;Inherit;True;Property;_MainTex;Main Texture;1;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;48;130.574,29.72424;Inherit;False;Property;_Desat;Desat;8;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;47;337.574,-143.2758;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;3;508,-175;Float;False;True;-1;7;ASEMaterialInspector;0;0;Unlit;Custom/PostEffect;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;2;False;-1;7;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;True;Transparent;;Overlay;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;35;0;36;0
WireConnection;25;0;24;0
WireConnection;46;0;26;2
WireConnection;46;1;25;0
WireConnection;45;0;26;1
WireConnection;45;1;35;0
WireConnection;30;0;45;0
WireConnection;30;1;33;0
WireConnection;32;0;31;0
WireConnection;32;1;46;0
WireConnection;28;0;32;0
WireConnection;23;0;30;0
WireConnection;39;0;23;0
WireConnection;39;1;38;0
WireConnection;39;2;42;0
WireConnection;40;0;28;0
WireConnection;40;1;37;0
WireConnection;40;2;43;0
WireConnection;44;0;39;0
WireConnection;44;1;40;0
WireConnection;11;0;13;0
WireConnection;11;1;44;0
WireConnection;17;1;11;0
WireConnection;47;0;17;0
WireConnection;47;1;48;0
WireConnection;3;2;47;0
ASEEND*/
//CHKSM=AFCE8E6E3654853EA53CFD83532543B59BB3EB76