#include "ai_planning/RPClean.h"

namespace KCL_rosplan {

    // constructor
    RPClean::RPClean(ros::NodeHandle &nh) {
        nh_ = nh;
    }

    bool RPClean::concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg) {
        // INSERTA TU CODIGO AQUI
        // Configurar un publisher para el movimiento (igual que en RPMoveBase)
    ros::Publisher velocity_publisher = nh_.advertise<geometry_msgs::Twist>("/cmd_vel", 10);

    // Crear un mensaje de velocidad
    geometry_msgs::Twist vel_msg;
    vel_msg.linear.x = 0.0;   // No avanzamos
    vel_msg.angular.z = 0.5; // Velocidad angular para girar

    // Tiempo necesario para un giro completo (aproximadamente 7.5 segundos a 0.5 rad/s)
    ros::Rate rate(10); // Frecuencia de 10 Hz
    int steps = static_cast<int>((2 * M_PI) / (0.5 * (1.0 / rate.expectedCycleTime().toSec()))); 

    for (int i = 0; i < steps; i++) {
        velocity_publisher.publish(vel_msg);
        ros::spinOnce();
        rate.sleep();
    }

    // Detener el robot después del giro
    vel_msg.angular.z = 0.0;
    velocity_publisher.publish(vel_msg);
    ROS_INFO("Limpieza completada: giro de 360º realizado.");

        return true;
    }
    
} // close namespace

int main(int argc, char **argv) {

    ros::init(argc, argv, "rosplan_interface_clean");

    ros::NodeHandle nh("~");

    // create PDDL action subscriber
    KCL_rosplan::RPClean rpmb(nh);

    rpmb.runActionInterface();

    return 0;
}
