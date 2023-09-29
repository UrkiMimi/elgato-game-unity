// Heavily modified version of https://github.com/UrkiMimi/2D-Game-Plat-Demo/blob/main/Assets/Scripts/SimplePlayerControl.cs.

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SimplePlayerControl : MonoBehaviour
{
    // Start of defining variables
    private float x;

    private float y;

    private BoxCollider2D coll2D;

    public Rigidbody2D rb2D;

    private Vector2 PlayerAxis;

    [SerializeField]
    public float Speed;

    [SerializeField]
    public float SmoothStopParam;

    [SerializeField]
    public float JumpHeight;

    // Start is called before the first frame update
    void Start()
    {
        // Initialize Collider
        coll2D = GetComponent<BoxCollider2D>();

        // If the user of this sets the SmoothStopParam float to a value higher than 1
        if (SmoothStopParam >= 1)
            SmoothStopParam = 1.0f;
    }

    // Update is called once per frame
    void Update()
    {
        // Make it so the variables go to zero eventually
        x = (x * SmoothStopParam);
        y = (y * 0.1f); 
        Application.targetFrameRate = 60; // Framelimit cause my code is bad

        // Controller inputs
        PlayerAxis.x = Input.GetAxis("Horizontal");
        PlayerAxis.y = Input.GetAxis("Vertical");

        x = PlayerAxis.x * Speed * Time.deltaTime;

        if (PlayerAxis.y == 1f && coll2D.IsTouchingLayers())
            rb2D.AddForce(transform.up * JumpHeight, ForceMode2D.Impulse);

        // Control Position of gameObject
        gameObject.transform.position = new Vector2 (transform.position.x + x, transform.position.y + y);
    }
}
