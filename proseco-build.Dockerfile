# ROS Base Image
FROM karlkurzer/proseco:tf-gpu-ros

# BUILD/RUN Dependencies
RUN apt update && apt install -y \
    libeigen3-dev
