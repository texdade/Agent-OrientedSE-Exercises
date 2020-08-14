:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

add searchBook(Genre) && (belief requested_from(Cashier)) => [
    act (pickUpBook(Genre), Book),
    cr goto(Book),
    act pickup(Book),
    cr goto(Cashier),
    act dropDown,
    add_agent_desire(Cashier,sellBook(Book)),
    del_belief(busy),
    del_belief(requested_from(Cashier)),
    cr writeonballoon("1"),
    stop
].