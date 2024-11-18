#!/bin/bash

DOMAIN=$1
PROBLEM=$2
OPTIMISE=$3
PLANNER=Metric-FF
#PLANNER=popf
TIMEOUT=0
ROSPLAN_PATH=$(rospack find rosplan_planning_system)

if [[ $TIMEOUT > 0 ]]
then
    if [[ $PLANNER == popf ]]
    then
        if [[ $OPTIMISE == opt ]]
        then
            timeout $TIMEOUT $ROSPLAN_PATH/common/bin/$PLANNER -n $1 $2
        else
            timeout $TIMEOUT $ROSPLAN_PATH/common/bin/$PLANNER $1 $2
        fi
    else 
        if [[ $OPTIMISE == opt ]]
        then
            timeout $TIMEOUT $ROSPLAN_PATH/common/bin/$PLANNER -o $1 -f $2 -s 3
        else 
            timeout $TIMEOUT $ROSPLAN_PATH/common/bin/$PLANNER -o $1 -f $2 -s 0
        fi
    fi
else
    if [[ $PLANNER == popf ]]
    then
        if [[ $OPTIMISE == opt ]]
        then
            $ROSPLAN_PATH/common/bin/$PLANNER -n $1 $2
        else
            $ROSPLAN_PATH/common/bin/$PLANNER $1 $2
        fi
    else
        if [[ $OPTIMISE == opt ]]
        then
            $ROSPLAN_PATH/common/bin/$PLANNER -o $1 -f $2 -s 3
        else 
            $ROSPLAN_PATH/common/bin/$PLANNER -o $1 -f $2 -s 0
        fi
    fi
fi

