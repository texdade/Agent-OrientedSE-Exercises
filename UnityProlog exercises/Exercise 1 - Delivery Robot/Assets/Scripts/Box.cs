using UnityLogic;

public class Box : Artifact
{
    public string kbPath = "KBs/prologfile";
    public string kbName = "kbName";

    void Start()
    {
        Init(kbPath, kbName);
    }
}
