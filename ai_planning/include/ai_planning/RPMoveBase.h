#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Pose2D.h>
#include <nav_msgs/Odometry.h>
#include <vector>
#include <iostream>
#include <fstream>
#include <actionlib/client/simple_action_client.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <geometry_msgs/PoseStamped.h>
#include <std_srvs/Empty.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf/tf.h>
#include <unistd.h>
#include <rosplan_action_interface/RPActionInterface.h>

#ifndef KCL_movebase
#define KCL_movebase

/**
 * This file defines the RPMoveBase class.
 * RPMoveBase is used to connect ROSPlan to the MoveBase library.
 * PDDL "goto_waypoint" actions become "move_base_msgs::MoveBase" actions.
 * Waypoint goals are fetched by id from the parameter server.
 */

namespace KCL_rosplan {

    class RPMoveBase: public RPActionInterface
    {

      public:

        /**
         * @brief constructor
         */
        RPMoveBase(ros::NodeHandle &nh);

        /**
         * @brief listen to and process action_dispatch topic
         * @param msg this parameter comes from the topic subscription, it contains the request (id, name, params, etc)
         * @return true if execution was successful
         */
        bool concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg);

        void odomCallback(const nav_msgs::OdometryConstPtr& msg);

        int classifyMovement(geometry_msgs::Pose2D origen, geometry_msgs::Pose2D destino);

        bool getCoordenadas(geometry_msgs::Pose2D& point, const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg, int index);

      private:

        /// nodehandle, manages e.g. subscriptions and publications
        ros::NodeHandle nh_;
        geometry_msgs::Pose2D current_pose;
    };
}
#endif
