:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

add recycle(Garbage) && (\+ has_garbage(_)) => [
    cr goto(Garbage),
    act pickUp(Garbage),
    add_belief(has_garbage(Garbage)),
    act (searchBin("Paper"), Bin),
    cr goto(Bin),
    act recycle,
    del_desire(recycle),
    del_belief(has_garbage(Garbage)),
    stop
].