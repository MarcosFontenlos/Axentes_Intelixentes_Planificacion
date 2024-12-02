#include "ai_planning/RPClean.h"

namespace KCL_rosplan {

    // constructor
    RPClean::RPClean(ros::NodeHandle &nh) {
        nh_ = nh;
    }

    bool RPClean::concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg) {
        // INSERTA TU CODIGO AQUI
        // Configurar un publisher para el movimiento (igual que en RPMoveBase)
    ros::Publisher velocity_publisher = nh_.advertise<geometry_msgs::Twist>("/mobile_base/commands/velocity", 10);

    // Crear un mensaje de velocidad
    geometry_msgs::Twist vel_msg;
    vel_msg.linear.x = 0.0;   // No avanzamos
    vel_msg.angular.z = 1.0; // Velocidad angular para girar
    
    double angular_speed = 1.0;   // Nueva velocidad angular en rad/s
    double full_rotation = 2 * M_PI; // radianes en 360º
    double rotation_time = full_rotation / angular_speed; // Tiempo necesario

    ros::Duration rotation_duration(4.5); // Girar durante 10 segundos
    ros::Time start_time = ros::Time::now();
    ROS_INFO("Comenzando limpieza: giro durante 5 segundos.");

    while (ros::Time::now() - start_time < rotation_duration) {
        velocity_publisher.publish(vel_msg);
        ros::spinOnce();
        ros::Rate(10).sleep(); // Frecuencia de publicación: 10 Hz
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
