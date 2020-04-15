# ROS Base Image
FROM karlkurzer/proseco:ros

# BUILD/RUN Dependencies
RUN apt update && apt install -y \
    libeigen3-dev
