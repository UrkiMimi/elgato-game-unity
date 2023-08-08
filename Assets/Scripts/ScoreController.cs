using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ScoreController : MonoBehaviour
{   
    // Vars
    public static ScoreController instance;

    public AudioSource PointSound;

    public AudioSource PipeSound;

    private TextMeshPro text;

    private int score;

    // Scripts 
    private void Awake()
    {
        instance = this;
    }

    void Start()
    {
        score = 0;
        text = GetComponent<TextMeshPro>();
    }

    void Update()
    {
        text.SetText("score: " + score.ToString());
        text.fontSize = ((text.fontSize - 8) * Time.deltaTime * 45 ) + 8;
    }

    public void AddScore()
    {
        score += 1;
        PointSound.Play();
        text.fontSize = 12.0f;
    }
    
    public void Pipe()
    {
        PipeSound.Play();
    }
}
