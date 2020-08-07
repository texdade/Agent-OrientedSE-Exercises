using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoxSpawner : MonoBehaviour
{

    public GameObject prefab_A, prefab_B, prefab_C, prefab_D;

    // Use this for initialization
    void Start()
    {
        StartCoroutine(SpawnBoxes(10, 5));
    }

    // *numberOfBoxes* boxes should be spawned every *frequency* seconds
    IEnumerator SpawnBoxes(int numberOfBoxes, float frequency)
    {
        for (int i = 0; i < numberOfBoxes; i++)
        {
            GameObject selectedBox;

            // Choose a random storage area for the box
            int randomArea = Random.Range(0, 4);

            switch (randomArea)
            {
                case 0:
                    selectedBox = prefab_A;
                    break;
                case 1:
                    selectedBox = prefab_B;
                    break;
                case 2:
                    selectedBox = prefab_C;
                    break;
                case 3:
                    selectedBox = prefab_D;
                    break;
                default:
                    selectedBox = prefab_A;
                    break;
            }

            // Instantiate the new box
            GameObject newBox = Instantiate(selectedBox, this.gameObject.transform);

            // Place the box randomly inside the pickup area
            newBox.transform.position = newBox.transform.position + new Vector3(Random.Range(-15, 15), 0.5f, Random.Range(-15, 15));

            // Wait some time
            yield return new WaitForSeconds(frequency);
        }
    }
}
