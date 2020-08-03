; domain file: gripper-domain.pddl
(define (domain gripper)
    (:predicates
        (robot-position ?x)
        (ball-position ?x ?y) ;;ball x is on room y
        (free ?x) ;arm x is free
        (clear ?x) ;ball x is on the ground
        (holding ?x ?y) ;arm x is holding ball y
    )
    (:action move
        :parameters (?x ?y)
        :precondition (and (robot-position ?x))
        :effect (and (robot-position ?y) (not (robot-position ?x)))
    )
    (:action pickup
        :parameters (?arm ?ball ?room)
        :precondition (and (robot-position ?room) (ball-position ?ball ?room) (free ?arm) (clear ?ball))
        :effect (and (not (free ?arm)) (not (clear ?ball)) (holding ?arm ?ball))
    )
    (:action drop
        :parameters (?arm ?ball ?room)
        :precondition (and (holding ?arm ?ball) (robot-position ?room))
        :effect (and (not (holding ?arm ?ball)) (free ?arm) (clear ?ball) (ball-position ?ball ?room))
    )
)