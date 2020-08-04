(define 
    (problem bunny)
    (:domain bunny)
    (:objects 
        bunny
        carrots
        box
        room1
        room2
        room3
    )
    (:init
        (bunny-position room1)
        (carrots-position room2)
        (box-position room3)
        (not (high rabbit))
    )
    (:goal
        (grasped carrots)
    )
)