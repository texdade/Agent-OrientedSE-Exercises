;; domain file: blocksworld-domain.pddl
(define (domain blocksworld)

    (:requirements :strips)
    (:predicates 
        (clear ?x)
        (on-table ?x)
        (holding ?x)
        (on ?x ?y)
        (free)
    )
    (:action pickup
        :parameters (?obj)
        :precondition (and (clear ?obj) (on-table ?obj) (free))
        :effect (and (holding ?obj) (not (clear ?obj)) (not(on-table ?obj)) (not (free)))
    )
    (:action place-on
        :parameters (?obj-hold ?target)
        :precondition (and (holding ?obj-hold) (on-table ?target) (not (free)))
        :effect (and (not (holding ?obj-hold)) (on-table ?obj-hold) (clear ?obj-hold) (on ?obj-hold ?target))
    )
)