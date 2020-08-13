:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

add sellBook(Genre) && (belief requested_from(_)) => [
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