using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AppleSpawner : MonoBehaviour
{
    public GameObject Apple;

    public Vector2 ApplePosition;

    public float WaitTime;

    private bool HaltSpawner = false; 

    private Vector2 rand;

    void Start()
    {
        InvokeRepeating("SpawnApple", WaitTime, WaitTime);
    }

    void Update()
    {
        rand = new Vector2(Random.Range(-1f * ApplePosition.x, ApplePosition.x), ApplePosition.y);
    }

    public void SpawnApple(){
        Instantiate(Apple, rand, transform.rotation);
        if(HaltSpawner)
        {
            CancelInvoke("SpawnApple");
        }
    }
}
