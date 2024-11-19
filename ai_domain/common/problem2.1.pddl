(define (problem clean_grid)
(:domain turtlebot_ejer2)

(:objects
    kenny - robot
    wp00 wp10 wp20 wp30 wp31 - waypoint
    trash_bin - trashpoint
)

(:init
    (at kenny wp00) ; El robot comienza en wp00
    (trashpoint trash_bin) ; El contenedor de basura está en trash_bin
    (contains-trash wp30) ; wp30 tiene basura
    (contains-trash wp31) ; wp31 tiene basura
    (connected wp00 wp10) ; Conexión entre puntos
    (connected wp10 wp20)
    (connected wp20 wp30)
    (connected wp30 wp31)
    (connected wp31 wp00) ; Conexión circular
)


(:goal (and
    (not (contains-trash wp30)) ; La basura de wp30 debe ser retirada
    (not (contains-trash wp31)) ; La basura de wp31 debe ser retirada
    (not (has-trash kenny)) ; El robot no debe llevar basura
    (at kenny wp00) ; El robot debe estar en wp00 (el punto 0, 0)
))
)
