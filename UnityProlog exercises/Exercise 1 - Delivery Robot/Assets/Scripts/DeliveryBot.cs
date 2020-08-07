using UnityLogic;
using System.Collections;
using UnityEngine;
using UnityEngine.AI;
using TMPro;

public class DeliveryBot : Agent
{
    private NavMeshAgent nav;

    public string kbPath = "KBs/PrologFile";
    public string kbName = "KbName";

    void Start()
    {
        Init(kbPath, kbPath);
        nav = GetComponent<NavMeshAgent>();
    }

    // Go towards a GameObject
    public IEnumerator Goto(GameObject go)
    {
        nav.enabled = true;
        nav.isStopped = false;

        nav.SetDestination(go.transform.position);

        while (!nav.enabled || nav.pathPending)
        {
            yield return null;
        }

        while (!nav.enabled || nav.remainingDistance > 0.5f)
        {
            yield return null;
        }

        nav.isStopped = true;
        nav.enabled = false;
    }

    // Pick a GameObject up
    public void PickUp(GameObject go)
    {
        go.transform.SetParent(transform);
        go.gameObject.transform.localPosition = new Vector3(0, 1, 0);
    }

    // Drop a GameObject down
    public void DropDown()
    {
        Artifact go = GetComponentInChildren<Artifact>();
        if (go == null)
        {
            return;
        }
        go.gameObject.transform.parent = null;
        go.gameObject.transform.Translate(Random.Range(-5, 5), 0.5f, Random.Range(-5, 5));
    }

    // Sense the environment for an artifact
    public GameObject SenseArtifact()
    {
        // Sense and collect all the environment's objects having a collider
        Collider[] hitColliders = Physics.OverlapSphere(transform.position, 30);

        foreach (Collider coll in hitColliders)
        {
            // if this collider belongs to an Artifact
            if (coll.gameObject.GetComponent<Artifact>() != null)
            {
                return coll.gameObject;
            }
        }

        // If not returned before, it means that the agent has sensed nothing
        return null;
    }

    // Get the reference to an area
    public GameObject GetArea(string areaName)
    {
        switch (areaName)
        {
            case "Pickup":
                return GameObject.Find("PickupArea");
            case "A":
                return GameObject.Find("Area_A");
            case "B":
                return GameObject.Find("Area_B");
            case "C":
                return GameObject.Find("Area_C");
            case "D":
                return GameObject.Find("Area_D");
            default:
                return GameObject.Find("PickupArea");
        }
    }

    // print whatever you want on the console from a UnityProlog plan
    public void PrintLog(string str)
    {
        Debug.Log(str);
    }

}
