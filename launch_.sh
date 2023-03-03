#!/bin/bash

sudo chmod 777 /dev/ttyUSB0
sudo chmod 777 /dev/ttyUSB1
sudo chmod 777 /dev/ttyUSB2
#sudo chmod 777 /dev/ttyS0
#sudo chmod 777 /dev/ttyTHS0

source /opt/ros/melodic/setup.bash
source ~/.bashrc
source ~/catkin_ws/devel/setup.bash
source ~/catkinywb_ws/devel/setup.bash



gnome-terminal --window -e 'bash -c "roscore; exec bash"' \
--tab -e 'bash -c "sleep 5; roslaunch mavros px4.launch; exec bash"' \
--tab -e 'bash -c "sleep 5; roslaunch uav_test UAV_test.launch; exec bash"' \
--tab -e 'bash -c "sleep 10; roslaunch servo_control servo_control.launch"'\

gnome-terminal --window -e 'bash -c "sleep 5; rostopic echo /mavros/local_position/pose; exec bash"' \
#gnome-terminal --window -e 'bash -c "sleep 5; rostopic echo /; exec bash"' \
gnome-terminal --window -e 'bash -c "sleep 5; rostopic echo /mavros/state; exec bash"' \
#--tab -e 'bash -c "sleep 5; roslaunch usb_cam usb_cam-test.launch; exec bash"' \

#--tab -e 'bash -c "sleep 0; rosrun ORB_SLAM3 T256_Stereo /home/dji/LX_FILES/ORB_SLAM3/Vocabulary/ORBvoc.txt /home/dji/LX_FILES/ORB_SLAM3/Examples/Stereo/t256.yaml false; exec bash"' \
#--tab -e 'bash -c "sleep 2; rosrun save_trajectory save_trajectory_node; exec bash"' \
#--tab -e 'bash -c "sleep 2; rosbag record -a; exec bash"' \
#--tab -e 'bash -c "sleep 0; rosrun ORB_SLAM3 T256_Stereo_Inertial /home/dji/LX_FILES/ORB_SLAM3/Vocabulary/ORBvoc.txt /home/dji/LX_FILES/ORB_SLAM3/Examples/Stereo-Inertial/t256.yaml false; exec bash"' \
#--tab -e 'bash -c "sleep 2; rosrun nokov_ros nokov_ros_node; exec bash"' \
#--tab -e 'bash -c "sleep 3; rosrun save_trajectory save_trajectory_node; exec bash"' \
