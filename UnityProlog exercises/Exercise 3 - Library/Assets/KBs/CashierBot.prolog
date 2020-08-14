:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

add getBook(Genre) && (belief requested_from(_)) => [
    act (getSlave,Slave),
    ( /*Lock mechanism so that clients have to "queue"*/
        not(check_agent_belief(Slave,busy)),
        add_agent_belief(Slave,busy)    
    ),
    act (getMyself,Myself),
    add_agent_belief(Slave,requested_from(Myself)),
    add_agent_desire(Slave,searchBook(Genre)),
    stop
].

add sellBook(Book) && (belief requested_from(Customer)) => [
    cr writeonballoon("here"),
    cr goto(Book),
    act pickUp(Book),
    cr goto(Customer),
    act dropDown,
    cr writeOnBalloon("Book sold!"),
    add_agent_desire(Customer,pickBook(Book)),
    del_agent_belief(Customer,waiting_for_cashier),
    del_belief(requested_from(Customer)),
    del_belief(busy),
    stop
].