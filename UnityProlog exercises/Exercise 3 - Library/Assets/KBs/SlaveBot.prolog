:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

add searchBook(Genre) && (belief requested_from(_)) => [
    act (pickUpBook(Genre), book),
    stop
].