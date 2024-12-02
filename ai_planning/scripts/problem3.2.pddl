(define (problem turtlebot_problem3)
(:domain turtlebot_ejer3)

(:objects
    kenny - robot
    wp00 wp10 wp01 wp11 wp02 wp20 wp22 wp21 wp12 wp30 wp31 wp23 wp32 wp33 - waypoint
)

(:init
    (at kenny wp00)
    (connected wp00 wp01)
    (connected wp00 wp10)
    (connected wp01 wp02)
    (connected wp10 wp20)
    (connected wp02 wp12)
    (connected wp12 wp22)
    (connected wp20 wp21)
    (connected wp21 wp22)
    (connected wp22 wp32)
    (connected wp22 wp23)
    (connected wp23 wp33)
    (connected wp32 wp33)

    (contains-trash wp22)
    (is-trashpoint wp33)
    (= (battery-level kenny) 100) ; Nivel inicial de batería
    (= (move-cost wp00 wp01) 5) 
    (= (move-cost wp01 wp02) 5) 
    (= (move-cost wp02 wp12) 5) 
    (= (move-cost wp12 wp22) 5)
    (= (move-cost wp22 wp32) 5) 
    (= (move-cost wp32 wp33) 5) 

    (= (move-cost wp00 wp10) 10) 
    (= (move-cost wp10 wp20) 10) 
    (= (move-cost wp20 wp21) 10) 
    (= (move-cost wp21 wp22) 10) 
    (= (move-cost wp22 wp23) 10) 
    (= (move-cost wp23 wp33) 10) 
    (= (clean-cost wp22) 20) ; Costo de limpiar wp01
)


(:goal (and
    (not (contains-trash wp22))
    (not (has-trash kenny))
))

(:metric maximize (battery-level kenny)) ; Maximizar la batería restante
)


