(define (problem clean_grid)
(:domain turtlebot_ejer2)

(:objects
    kenny - robot
    wp00 wp10 wp20 wp30 wp31 wp11 wp21 wp22  - waypoint
    
)

(:init
    (at kenny wp00)
    (is-trashpoint wp00)
    
    (contains-trash wp10)
    
    (connected wp00 wp10)
    (connected wp10 wp00)
    (connected wp10 wp11)
    (connected wp11 wp10)
    (connected wp20 wp21)
    (connected wp21 wp20)
    (connected wp21 wp22)
    (connected wp22 wp21)
    (connected wp10 wp20)
    (connected wp20 wp10)
    (connected wp20 wp30)
    (connected wp30 wp20)
    (connected wp30 wp31)
    (connected wp31 wp30)
)

(:goal (and
    
    
    (not (contains-trash wp10))
    (not (has-trash kenny))
))
)
