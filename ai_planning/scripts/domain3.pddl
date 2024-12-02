(define (domain turtlebot_ejer3)

(:requirements :strips :typing :fluents :negative-preconditions)

(:types
    robot waypoint
)

(:predicates
    (at ?r - robot ?wp - waypoint) ; Indica que el robot está en un waypoint
    (connected ?wp1 - waypoint ?wp2 - waypoint) ; Indica que dos waypoints están conectados
    (has-trash ?r - robot) ; Indica que el robot lleva basura
    (contains-trash ?wp - waypoint) ; Indica que un waypoint contiene basura
    (is-trashpoint ?wp - waypoint) ; Indica que un waypoint es un punto de descarga
)

(:functions
    (battery-level ?r - robot) ; Representa el nivel de batería del robot
    (move-cost ?wp1 - waypoint ?wp2 - waypoint) ; Costo de batería para moverse entre dos waypoints
    (clean-cost ?wp - waypoint) ; Costo de batería para limpiar un waypoint
)

(:action move
    :parameters (?r - robot ?wp1 - waypoint ?wp2 - waypoint)
    :precondition (and
        (at ?r ?wp1)
        (connected ?wp1 ?wp2)
        (>= (battery-level ?r) (move-cost ?wp1 ?wp2)) ; Verificar que haya suficiente batería
    )
    :effect (and
        (not (at ?r ?wp1))
        (at ?r ?wp2)
        (decrease (battery-level ?r) (move-cost ?wp1 ?wp2)) ; Reducir batería según el costo
    )
)

(:action clean
    :parameters (?r - robot ?wp - waypoint)
    :precondition (and
        (at ?r ?wp)
        (contains-trash ?wp)
        (not (has-trash ?r))
        (>= (battery-level ?r) (clean-cost ?wp)) ; Verificar que haya suficiente batería
    )
    :effect (and
        (has-trash ?r)
        (not (contains-trash ?wp))
        (decrease (battery-level ?r) (clean-cost ?wp)) ; Reducir batería según el costo
    )
)


(:action empty
    :parameters (?r - robot ?wp - waypoint)
    :precondition (and
        (at ?r ?wp)
        (is-trashpoint ?wp)
        (has-trash ?r)
    )
    :effect (and
        (not (has-trash ?r))
    )
)
)


