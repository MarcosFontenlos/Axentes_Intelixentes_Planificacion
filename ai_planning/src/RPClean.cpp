#include "ai_planning/RPClean.h"

namespace KCL_rosplan {

    // constructor
    RPClean::RPClean(ros::NodeHandle &nh) {
        nh_ = nh;
    }

    bool RPClean::concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg) {
        // INSERTA TU CODIGO AQUI
        

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
