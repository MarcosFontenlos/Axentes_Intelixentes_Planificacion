(define (domain turtlebot_ejer2)

(:requirements :strips :typing :fluents)

(:types
    robot waypoint
)

(:predicates
    (at ?r - robot ?wp - waypoint) ; Indica que el robot está en un waypoint
    (connected ?wp1 - waypoint ?wp2 - waypoint) ; Indica que dos waypoints están conectados
    (has-trash ?r - robot) ; Indica que el robot lleva basura
    (contains-trash ?wp - waypoint) ; Indica que un waypoint contiene basura
    (is-trashpoint ?wp - waypoint)
)

(:action move
    :parameters (?r - robot ?wp1 - waypoint ?wp2 - waypoint)
    :precondition (and
        (at ?r ?wp1)
        (connected ?wp1 ?wp2)
    )
    :effect (and
        (not (at ?r ?wp1))
        (at ?r ?wp2)
    )
)

(:action clean
    :parameters (?r - robot ?wp - waypoint)
    :precondition (and
        (at ?r ?wp)
        (contains-trash ?wp)
        (not (has-trash ?r))
    )
    :effect (and
        (has-trash ?r)
        (not (contains-trash ?wp))
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
