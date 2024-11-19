(define (problem clean_grid)
(:domain turtlebot_ejer2)

(:objects
    kenny - robot
    wp00 wp10 wp20 wp30 wp31 - waypoint
    trash_bin - trashpoint
)

(:init
    (at kenny wp00)
    (trashpoint trash_bin)
    (contains-trash wp30)
    (contains-trash wp31)
    (connected wp00 wp10)
    (connected wp10 wp20)
    (connected wp20 wp30)
    (connected wp30 wp31)
    (connected wp31 wp00) ; Conexión circular para facilitar los movimientos
)


(:goal (and
    (not (contains-trash wp30))
    (not (contains-trash wp31))
    (not (has-trash kenny))
))
)
