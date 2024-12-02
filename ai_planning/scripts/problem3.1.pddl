(define (problem turtlebot_problem3)
(:domain turtlebot_ejer3)

(:objects
    kenny - robot
    wp00 wp10 wp01 wp02 wp20 wp30 wp31 wp11 wp21 wp22 - waypoint
)

(:init
    (at kenny wp00)
    (connected wp00 wp01)
    (connected wp01 wp00)
    (connected wp01 wp02)
    (contains-trash wp01)
    (is-trashpoint wp00)
    (= (battery-level kenny) 100) ; Nivel inicial de batería
    (= (move-cost wp00 wp01) 10) ; Costo de moverse de wp00 a wp01
    (= (move-cost wp01 wp00) 10) ; Costo de moverse de wp00 a wp01
    (= (move-cost wp01 wp02) 15) ; Costo de moverse de wp01 a wp02
    (= (clean-cost wp01) 20) ; Costo de limpiar wp01
)


(:goal (and
    (not (contains-trash wp01))
    (not (has-trash kenny))
))

(:metric maximize (battery-level kenny)) ; Maximizar la batería restante
)


