; domain file: bunny-domain.pddl
(define (domain bunny)
    (:predicates
        (bunny-position ?x)
        (box-position ?x)
        (carrots-position ?x)
        (high ?x) ;indicates whether the rabbit is on a high position or not 
        (grasped ?x)
    )
    (:action move
        :parameters (?bunny ?x ?y)
        :precondition (and (bunny-position ?x) (not (high ?bunny)))
        :effect (and (bunny-position ?y) (not (bunny-position ?x)))
    )
    (:action push
        :parameters (?bunny ?x ?y)
        :precondition (and (bunny-position ?x) (not (high ?bunny)) (box-position ?x))
        :effect (and (bunny-position ?y) (box-position ?y) (not (bunny-position ?x)) (not (box-position ?x)))
    )
    (:action climb-up
        :parameters (?bunny ?x)
        :precondition (and (bunny-position ?x) (box-position ?x) (not (high ?bunny)))
        :effect (high ?bunny)
    )
    (:action climb-down
        :parameters (?bunny ?x)
        :precondition (and (bunny-position ?x) (box-position ?x) (high ?bunny))
        :effect (not (high ?bunny))
    )
    (:action grasp
        :parameters (?bunny ?carrots ?x)
        :precondition (and (bunny-position ?x) (carrots-position ?x) (high ?bunny))
        :effect (grasped ?carrots)
    )
)