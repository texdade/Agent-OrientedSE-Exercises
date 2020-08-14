:- consult("UnityLogic/KBs/UnityLogicAgentAPI.prolog").

desire decideGenre.

add decideGenre && (\+ belief has_decided_genre(_)) => [
    act (decideForGenre, Genre),
    add_belief(has_decided_genre(Genre)),
    add_desire(get_book(Genre)),
    stop
].

add get_book(Genre) && ((belief has_decided_genre(Genre)), (\+ belief waiting_for_cashier)) => [
    act (getCashier, Cashier),
    ( /*Lock mechanism so that clients have to "queue"*/
        not(check_agent_belief(Cashier,busy)),
        add_agent_belief(Cashier,busy)    
    ),
    cr goto(Cashier),
    act (getMyself,Myself),
    add_agent_belief(Cashier,requested_from(Myself)),
    add_agent_desire(Cashier,getBook(Genre)),
    add_belief(waiting_for_cashier),
    stop
].

add pickBook(Book) && (\+ belief waiting_for_cashier) => [
    cr goto(Book),
    act pickUp(Book),
    act (getExit, Exit),
    cr goto(Exit),
    act (getMyself, Myself),
    act stopBot(Myself),
    stop
].