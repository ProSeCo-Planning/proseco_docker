FROM nvidia/cuda:11.1-runtime-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros1-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python3-rosdep \
    python3-vcstools \
    python3-rosinstall \
    && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV ROS_DISTRO noetic
# # bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# install ros packages & Eigen
RUN apt-get update && apt-get install -y \
    ros-noetic-ros-core=1.5.0-1* \
    libeigen3-dev \
    && rm -rf /var/lib/apt/lists/*

# set entrypoint
COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod a+rx /ros_entrypoint.sh

ENTRYPOINT [ "/ros_entrypoint.sh" ]
CMD ["bash"]