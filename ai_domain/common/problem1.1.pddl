(define (problem turtlebot_problem)
    (:domain turtlebot_ejer1)  ;; Hace referencia al dominio turtlebot_ejer1 definido previamente.

    (:objects
        wp00 wp01 wp02 wp03 wp10 wp11 wp12 wp13 wp20 wp21 wp22 wp23 wp30 wp31 - waypoint ;; Definimos todos los waypoints.
        turtlebot - robot  ;; Definimos el robot (turtlebot).
    )

    (:init
        (at turtlebot wp00)  ; El robot comienza en el waypoint wp00.
        (connected wp00 wp01)  ; wp00 está conectado con wp01.
        (connected wp01 wp02)  ; wp01 está conectado con wp02.
        (connected wp02 wp03)  ; wp02 está conectado con wp03.
        (connected wp03 wp13)  ; wp03 está conectado con wp13.
        (connected wp13 wp23)  ; wp13 está conectado con wp23.
        (connected wp23 wp31)  ; wp23 está conectado con wp31.
        (connected wp00 wp10)  ; wp00 está conectado con wp10.
        (connected wp10 wp11)  ; wp10 está conectado con wp11.
        (connected wp11 wp12)  ; wp11 está conectado con wp12.
        (connected wp12 wp13)  ; wp12 está conectado con wp13.
        (connected wp20 wp21)  ; wp20 está conectado con wp21.
        (connected wp21 wp22)  ; wp21 está conectado con wp22.
        (connected wp22 wp23)  ; wp22 está conectado con wp23.
        (connected wp30 wp31)  ; wp30 está conectado con wp31.
        
    )

    (:goal
        (at turtlebot wp31)  ;; El objetivo es que el robot llegue a wp31.
    )
)

