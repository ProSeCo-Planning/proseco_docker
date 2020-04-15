# ROS Base Image
FROM ros:melodic-ros-base-bionic

# BUILD/RUN Dependencies
RUN apt update && apt install -y \
    libeigen3-dev
