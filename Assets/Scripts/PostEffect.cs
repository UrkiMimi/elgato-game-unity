using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode, ImageEffectAllowedInSceneView]
public class PostEffect : MonoBehaviour
{
    // Init Stuff for Post Effects
    public static PostEffect instance;

    private Material mat;
    public Shader ScreenEffectShader;

    // Shader Materials
    public float XWaveFrequency = 1;

    public float YWaveFrequency = 1;

    public float XWaveIntensity = 0.1f;
    
    public float YWaveIntensity = 0.1f;

    public Vector2 WaveSpeed;

    [Range(0,1)]
    public float Desaturation;

    // Instance the script and create new material on startup
    private void Awake()
    {
        instance = this;
        mat = new Material(Shader.Find("Custom/PostEffect"));
    }

    // Render screen
    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        if (mat == null)
        {
            mat = new Material(ScreenEffectShader);
        }
        else
        {
            mat.SetFloat("_XFreq", XWaveFrequency);
            mat.SetFloat("_YFreq", YWaveFrequency);
            mat.SetFloat("_XInte", XWaveIntensity);
            mat.SetFloat("_YInte", YWaveIntensity);
            mat.SetFloat("_XSpeed", WaveSpeed.x);
            mat.SetFloat("_YSpeed", WaveSpeed.y);
            mat.SetFloat("_Desat", Desaturation);
            Graphics.Blit(src, dest, mat, 0);
        }

    }
    
    // Adjust values if GameOver is called
    public void GameOver()
    {
        Desaturation = 1;
        XWaveIntensity = 0.1f;
    }
}
