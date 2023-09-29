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

    private float t = 1.0f;

    // Instance script if awake
    private void Awake()
    {
        instance = this;
    }

    // Initialize some things
    void Start()
    {
        score = 0;
        text = GetComponent<TextMeshPro>();
    }

    // Update
    void Update()
    {
        // Set and animate text
        text.SetText("score: " + score.ToString());
        t += 5.0f * Time.deltaTime;
        text.fontSize = Mathf.Lerp(12, 8, t);

        // Stopgap so the t variable doesnt go above 1.0f and fuck up the lerp function
        if (t > 1.0f)
        {
            t = 1.0f;
        }
    }

    // Add point to score
    public void AddScore()
    {
        score += 1;
        PointSound.Play();
        t = 0.0f;
    }
    
    // Play the game over sound if triggered
    public void Pipe()
    {
        PipeSound.Play();
    }
}
