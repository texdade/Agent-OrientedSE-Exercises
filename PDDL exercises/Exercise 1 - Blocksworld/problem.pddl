(define 
    (problem blocksworld-prob1)
    (:domain blocksworld)
    (:objects a b)
    (:init (on-table a)(on-table b)(clear a)(clear b)(free))
    (:goal (and (on a b)))
)