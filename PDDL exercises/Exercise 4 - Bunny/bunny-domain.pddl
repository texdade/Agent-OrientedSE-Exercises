; domain file: bunny-domain.pddl
(define (domain bunny)
    (:predicates
        (bunny-position ?x)
        (box-position ?x)
        (carrots-position ?x)
        (low ?x)
        (high ?x)
        (grasped ?x)
        (is-bunny ?x)
        (is-box ?x)
    )
    (:action move
        :parameters (?bunny ?x ?y)
        :precondition (and (bunny-position ?x) (not (high ?bunny)) (is-bunny ?bunny))
        :effect (and (bunny-position ?y) (not (bunny-position ?x)))
    )
    (:action push
        :parameters (?bunny ?box ?x ?y)
        :precondition (and (bunny-position ?x) (low ?bunny) (box-position ?x) (low ?box) (not (high bunny)) (is-bunny ?bunny) (is-box ?box))
        :effect (and (bunny-position ?y) (box-position ?y) (not (bunny-position ?x)) (not (box-position ?x)))
    )
    (:action climb-up
        :parameters (?bunny ?x)
        :precondition (and (bunny-position ?x) (box-position ?x) (not (high ?bunny)) (is-bunny ?bunny))
        :effect (high ?bunny)
    )
    (:action climb-down
        :parameters (?bunny ?x)
        :precondition (and (bunny-position ?x) (box-position ?x) (high ?bunny))
        :effect (not (high ?bunny))
    )
    (:action grasp
        :parameters (?bunny ?carrots ?x)
        :precondition (and (bunny-position ?x) (carrots-position ?x) (high ?bunny) (is-bunny ?bunny))
        :effect (grasped ?carrots)
    )
)