(define (domain turtlebot_ejer1)

(:requirements :strips :typing :fluents) ; Se requieren STRIPS, typing y fluents.

(:types
    robot waypoint ; Definimos los tipos principales: robot y waypoint.
)

(:predicates
    (at ?r - robot ?wp - waypoint) ; Indica si el robot está en un waypoint.
    (connected ?wp1 - waypoint ?wp2 - waypoint) ; Indica si los waypoints están conectados.
)

;; Mueve el robot entre dos waypoints
(:action move
    :parameters (?r - robot ?wp1 - waypoint ?wp2 - waypoint) ; El robot se mueve de wp1 a wp2.
    :precondition (and
        (at ?r ?wp1) ; El robot está en wp1.
        (connected ?wp1 ?wp2) ; Los waypoints wp1 y wp2 están conectados.
    )
    :effect (and
        (not (at ?r ?wp1)) ; El robot deja de estar en wp1.
        (at ?r ?wp2) ; El robot pasa a estar en wp2.
    )
)

;; El robot limpia un waypoint (opcional, ejemplo)
;;(:action clean
;;    :parameters (?r - robot ?wp - waypoint) ; El robot puede limpiar un waypoint específico.
;;    :precondition (at ?r ?wp) ; El robot está en el waypoint que desea limpiar.
;;    :effect (cleaned ?wp) ; Marca el waypoint como limpio.
;;)

;; El robot vacía su papelera (opcional, ejemplo)
;;(:action empty
;;    :parameters (?r - robot)
;;    :precondition (has_trash ?r) ; Indica que el robot tiene basura en su papelera.
;;    :effect (not (has_trash ?r)) ; Vacía la papelera del robot.
;;)

)

