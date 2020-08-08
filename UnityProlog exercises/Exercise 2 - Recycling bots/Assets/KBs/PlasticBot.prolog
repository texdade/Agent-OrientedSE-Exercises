:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

desire searchGarbage.

add searchGarbage && (\+ belief has_garbage(_)) => [
    act (searchGarbage(), Garbage),
    cr goto(Garbage),
    add_desire(identifyGarbage),
    add_belief(identifying(Garbage)),
    stop
].

add identifyGarbage && (belief identifying(Garbage)) => [
    check_artifact_belief(Garbage, type(Type)),
    del_belief(identifying(Garbage)),
    act pickUp(Garbage),
    add_belief(has_garbage(Garbage)),
    Type = plastic,
    add_desire(recycle(plastic)),
    stop
].

add identifyGarbage && (belief has_garbage(Garbage)) => [
    act dropDown,
    del_belief(has_garbage(Garbage)),
    add_desire(searchGarbage),
    stop
].

add recycle(plastic) && (belief has_garbage(Garbage)) => [
    act (searchBin("Plastic"), Bin),
    cr goto(Bin),
    act recycle,
    del_belief(has_garbage(Garbage)),
    add_desire(searchGarbage),
    stop
].