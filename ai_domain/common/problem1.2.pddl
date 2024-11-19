(define (problem turtlebot_zigzag)
    (:domain turtlebot_ejer1)  ;; Hace referencia al dominio turtlebot_ejer1 definido previamente.

    (:objects
        wp00 wp01 wp02 wp03 wp10 wp11 wp12 wp13 wp20 wp21 wp22 wp23 wp30 wp31 - waypoint ;; Definimos todos los waypoints.
        turtlebot - robot  ;; Definimos el robot (turtlebot).
    )

    (:init
        (at turtlebot wp00)  ; El robot comienza en el waypoint wp00.
        (connected wp00 wp01)  ; wp00 está conectado con wp01.
        (connected wp01 wp11)  ; wp01 está conectado con wp11.
        (connected wp11 wp21) 
        (connected wp21 wp22)  
        (connected wp22 wp23)  
        (connected wp23 wp33)  
        
    )

    (:goal
        (at turtlebot wp31)  ;; El objetivo es que el robot llegue a wp31.
    )
)
