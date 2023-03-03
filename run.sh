#!/bin/bash
echo "odometry starting!!!"
{
    gnome-terminal -t "IMU" -- bash -c "source ~/imu_ws/devel/setup.sh && roslaunch xsens_mti_driver xsens_mti_node.launch;exec bash"
}&

sleep 3s
{
    gnome-terminal -t "Odometry" -- bash -c "source ~/odometry_ws/devel/setup.sh && roslaunch spinning_lidar_slam spinning_lidar_odometry.launch;exec bash"
}&

sleep 2s
{
    gnome-terminal -t "Motor" -- bash -c "source ~/odometry_ws/devel/setup.sh && roslaunch spinning_lidar_slam lidarRotation.launch;exec bash"
}&

sleep 3s
{
    gnome-terminal -t "VELODYNE" -- bash -c "source ~/velodyne_ws/devel/setup.sh && roslaunch velodyne_pointcloud VLP16_points.launch;exec bash"
}

