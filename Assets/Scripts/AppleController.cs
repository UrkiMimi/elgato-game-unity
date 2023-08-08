using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class AppleController : MonoBehaviour
{
    public float AppleFallSpeed;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        transform.position = new Vector3(
            transform.position.x,
            transform.position.y + (-1f * AppleFallSpeed * Time.deltaTime),
            transform.position.x
        );
    }

    
    IEnumerator GameCrash()
    {
        yield return new WaitForSecondsRealtime(0.2f);
        Destroy(gameObject);
        Debug.Log("lol");
        Application.Quit();
    }

    void OnCollisionEnter2D(Collision2D coll2D)
    {
        if (coll2D.gameObject.layer == 6)
        {
            ScoreController.instance.AddScore();
            Destroy(gameObject);
            Debug.Log("lmao");
        }
        else
        {
            Time.timeScale = 0.1f;
            ScoreController.instance.Pipe();
            PostEffect.instance.GameOver();
            StartCoroutine(GameCrash());
        }
    }
}
