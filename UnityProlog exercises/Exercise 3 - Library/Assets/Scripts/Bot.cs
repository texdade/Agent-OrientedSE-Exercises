using UnityLogic;
using System.Collections;
using UnityEngine;
using UnityEngine.AI;
using TMPro;

public class Bot : Agent
{
    private NavMeshAgent nav;

    public string kbPath = "KBs/PrologFile";
    public string kbName = "KbName";

    public TextMeshProUGUI balloonText;
    public RectTransform canvas;

    public GameObject bookPrefab;

    void Start()
    {
        Init(kbPath, kbPath);
        nav = GetComponent<NavMeshAgent>();

    }

    public GameObject DecideForGenre()
    {
        return GameObject.FindGameObjectsWithTag("Book")[Random.Range(0,7)];
    }

    public object GetMyself()
    {
        return this.gameObject;
    }

    public object GetCashier()
    {
        GameObject[] cashiers = GameObject.FindGameObjectsWithTag("Cashier");
        return cashiers[Random.Range(0, cashiers.Length)];
    }

    public object GetSlave()
    {
        GameObject[] slaves = GameObject.FindGameObjectsWithTag("Slave");
        return slaves[Random.Range(0, slaves.Length)];
    }

    public object GetExit()
    {
        GameObject[] exits = GameObject.FindGameObjectsWithTag("Exit");
        return exits[Random.Range(0, exits.Length)];
    }

    public IEnumerator Goto(GameObject go)
    {
        nav.enabled = true;
        nav.isStopped = false;

        nav.SetDestination(go.transform.position);

        while (!nav.enabled || nav.pathPending)
        {
            yield return null;
        }

        while (!nav.enabled || nav.remainingDistance > 1.2f)
        {
            yield return null;
        }

        nav.isStopped = true;
        nav.enabled = false;
    }

    public void PickUp(GameObject go)
    {
        go.transform.SetParent(transform);
        go.gameObject.transform.localPosition = new Vector3(0, 0, 1);
    }

    public void DropDown()
    {
        Artifact go = GetComponentInChildren<Artifact>();
        if (go == null)
        {
            return;
        }
        go.gameObject.transform.parent = null;
    }


    public GameObject PickupBook(GameObject g)
    {
        GameObject newG = Instantiate(bookPrefab);
        newG.name = "Book " + Random.Range(1, 100000);
        newG.GetComponent<Renderer>().material = g.GetComponent<Renderer>().material;
        newG.transform.localScale = Vector3.one / 2;

        newG.transform.SetParent(this.gameObject.transform);
        newG.transform.localPosition = new Vector3(0, 0, 1);

        return newG;
    }

    public void StopBot(GameObject bot)
    {
        Bot b = bot.GetComponent<Bot>();
        if (b == null)
        {
            return;
        }

        b.nav.enabled = false;
    }

    public void ResumeBot(GameObject bot)
    {
        Bot b = bot.GetComponent<Bot>();
        if (b == null)
        {
            return;
        }

        b.nav.enabled = true;
        b.nav.isStopped = false;
    }

    public IEnumerator WriteOnBalloon(string text)
    {
        canvas.gameObject.SetActive(true);
        //float yRot = 42f - transform.rotation.y;
        //canvas.localRotation = new Quaternion(0, yRot, 0, 0);
        canvas.LookAt(transform.position - Camera.main.transform.position);
        balloonText.text = text;

        float start = Time.timeSinceLevelLoad;

        while (Time.timeSinceLevelLoad - start < 2f)
        {
            yield return null;
        }

        balloonText.text = "";
        canvas.gameObject.SetActive(false);
    }

    // print whatever you want on the console from a UnityProlog plan
    public void PrintLog(string str)
    {
        Debug.Log(str);
    }
}
