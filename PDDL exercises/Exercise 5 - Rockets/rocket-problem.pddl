(define 
    (problem rocket)
    (:domain rocket)
    (:objects 
        Earth Moon Venus Mars
        Carol Beth Anna Emma Diane
        R1 R2 R3 R4
    )
    (:init
        (person-position Carol Earth) (is-person Carol)
        (person-position Beth Venus) (is-person Beth)
        (person-position Anna Venus) (is-person Anna)
        (person-position Emma Moon) (is-person Emma)
        (person-position Diane Mars) (is-person Diane)
        (rocket-position R1 Venus)
        (rocket-position R2 Earth)
        (rocket-position R3 Mars)
        (rocket-position R4 Moon)
        (fueled R1) (is-rocket R1)
        (fueled R2) (is-rocket R2)
        (fueled R3) (is-rocket R3)
        (fueled R4) (is-rocket R4)
        (is-planet Earth)
        (is-planet Moon)
        (is-planet Venus)
        (is-planet Mars)
    )
    (:goal (and
        (person-position Carol Mars)
        (person-position Beth Moon)
        (person-position Anna Earth)
        (person-position Emma Earth)
        (person-position Diane Moon)
    ))
)