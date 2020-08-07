; domain file: rocket-domain.pddl
(define (domain rocket)
    (:predicates
        (person-position ?person ?planet)
        (rocket-position ?rocket ?planet)
        (fueled ?rocket)
        (boarded ?person ?rocket)
        (on-board ?person)
        (is-rocket ?rocket)
        (is-person ?person)
        (is-planet ?planet)
    )
    (:action board
        :parameters (?person ?rocket ?x)
        :precondition (and (is-person ?person) (is-rocket ?rocket) (not (on-board ?person)) (person-position ?person ?x) (rocket-position ?rocket ?x))
        :effect (and (on-board ?person) (boarded ?person ?rocket) (not (person-position ?person ?x)))
    )
    (:action unboard
        :parameters (?person ?rocket ?x)
        :precondition (and (is-person ?person) (is-rocket ?rocket) (on-board ?person) (rocket-position ?rocket ?x) (boarded ?person ?rocket))
        :effect (and (not (on-board ?person)) (not (boarded ?person ?rocket)) (person-position ?person ?x))
    )
    (:action travel
        :parameters (?rocket ?x ?y)
        :precondition (and (is-rocket ?rocket) (fueled ?rocket) (rocket-position ?rocket ?x))
        :effect (and (not (fueled ?rocket)) (rocket-position ?rocket ?y) (not (rocket-position ?rocket ?x)))
    )
)