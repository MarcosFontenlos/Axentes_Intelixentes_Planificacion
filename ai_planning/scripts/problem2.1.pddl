(define (problem clean_grid)
(:domain turtlebot_ejer2)

(:objects
    kenny - robot
    wp00 wp10 wp20 wp30 wp31 - waypoint
    
)

(:init
    (at kenny wp00)
    (is-trashpoint wp00)
    
    (contains-trash wp31)
    (connected wp00 wp10)
    (connected wp10 wp00)
    (connected wp10 wp20)
    (connected wp20 wp10)
    (connected wp20 wp30)
    (connected wp30 wp20)
    (connected wp30 wp31)
    (connected wp31 wp30)
)

(:goal (and
    
    (not (contains-trash wp31))
    (not (has-trash kenny))
))
)
