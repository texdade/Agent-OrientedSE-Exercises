(define 
    (problem gripper)
    (:domain gripper)
    (:objects 
        Gripper
        Arm1
        Arm2
        Room1
        Room2
        Ball1
        Ball2
        Ball3
    )
    (:init
        (robot-position Room1)
        (ball-position Ball1 Room1)
        (ball-position Ball2 Room1)
        (ball-position Ball3 Room1)
        (free Arm1)
        (free Arm2)
        (clear Ball1)
        (clear Ball2)
        (clear Ball3)
    )
    (:goal (and
        (ball-position Ball1 Room2)
        (ball-position Ball2 Room2)
        (ball-position Ball3 Room2)
    ))
)