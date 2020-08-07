;; domain file: tsp-domain.pddl
(define (domain tsp)
    (:predicates
        (visited ?x)
        (connected ?x ?y)
        (position ?pos)
    )
    (:action move
        :parameters (?x ?y)
        :precondition (and (connected ?x ?y) (not (visited ?y)) (position ?x))
        :effect (and (position ?y) (visited ?y) (not (position ?x)))
    )
)