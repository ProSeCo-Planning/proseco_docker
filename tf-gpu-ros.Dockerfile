FROM karlkurzer/proseco:tf2-devel-gpu AS builder

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    libtool \
    cmake
    
# Configure Tensorflow installation
RUN cd ~ && \
    git clone https://github.com/tensorflow/tensorflow.git && \
    cd tensorflow && \
    git checkout r2.0 && \
    ./configure

# Build Tensorflow libraries
RUN cd ~/tensorflow && \ 
    bazel build //tensorflow:libtensorflow_cc.so && \
    bazel build //tensorflow:libtensorflow_framework.so

RUN cd ~/tensorflow && ./tensorflow/contrib/makefile/download_dependencies.sh

# Build Protobuf
RUN cd ~/tensorflow/tensorflow/contrib/makefile/downloads/protobuf/ && \
    ./autogen.sh && \
    ./configure && \
    make install

FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04
RUN mkdir -p ~/catkin_ws/lib && \
    mkdir -p ~/catkin_ws/include
# copy the library and header files to the respective locations
COPY --from=builder ~/tensorflow/bazel-bin/tensorflow/* ~/catkin_ws/lib
COPY --from=builder /usr/local/lib/libprotobuf.a ~/catkin_ws/lib
COPY --from=builder ~/tensorflow/bazel-genfiles/* ~/catkin_ws/include
COPY --from=builder ~/tensorflow/tensorflow/cc ~/catkin_ws/include/tensorflow
COPY --from=builder ~/tensorflow/tensorflow/core ~/catkin_ws/include/tensorflow
COPY --from=builder ~/tensorflow/third_party ~/catkin_ws/include
COPY --from=builder /usr/local/include/google ~/catkin_ws/include
COPY --from=builder ~/tensorflow/tensorflow/contrib/makefile/downloads/absl/absl ~/catkin_ws/include

ARG DEBIAN_FRONTEND=noninteractive

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros1-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV ROS_DISTRO melodic
# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-melodic-ros-core=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*
