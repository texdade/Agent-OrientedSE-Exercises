:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

desire searchGarbage.

/*If I already have the plan, just go for it*/
add searchGarbage && (\+ belief has_garbage(_)) => [
    act (searchGarbage, Garbage),
    cr goto(Garbage),
    check_artifact_belief(Garbage,type(Type)),
    act pickUp(Garbage),
    add_belief(has_garbage(Garbage)),
    check_plan(add recycle(Type),_),
    cr writeonballoon("Already have a plan for this!"),
    add_desire(recycle(Type)),
    stop
].

/*If the garbage is glass, read the plan on the artifact*/
add searchGarbage && (belief has_garbage(Garbage)) => [
    check_artifact_belief(Garbage,type(Type)),
    Type = glass,
    use_artifact(Garbage,recycle),
    del_belief(has_garbage(Garbage)),
    add_desire(searchGarbage),
    stop
].

/*If the garbage is plastic, learn how to recycle it with the help of the plasticBot*/
add searchGarbage && (belief has_garbage(Garbage)) => [
    check_artifact_belief(Garbage,type(Type)),
    Type = plastic,
    act (findPlasticBot,Bot),
    act stopBot(Bot),
    cr goto(Bot),
    learn_agent_plan(Bot,add recycle(Type),true),
    cr writeonballoon("Learned how to recycle plastics!"),
    act resumeBot(Bot),
    add_desire(recycle(Type)),
    stop
].

/*If the garbage is paper, paperBot will handle it*/
add searchGarbage && (belief has_garbage(Garbage)) => [
    check_artifact_belief(Garbage,type(Type)),
    Type = paper,
    act (findPaperBot,Bot),
    act dropDown,
    add_agent_desire(Bot,recycle(Garbage)),
    del_belief(has_garbage(Garbage)),
    add_desire(searchGarbage),
    stop
].