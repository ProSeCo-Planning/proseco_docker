# Overview
## BUILD Dependencies
* `tf2-devel-gpu.Dockerfile | tf2-devel-gpu` - prepares everything for building Tensorflow 2 from source
* `tf2-devel-gpu-build.Dockerfile | tf2-devel-gpu-build` - builds Tensorflow 2 from source
* `cuda-ros.Dockerfile | cuda-ros` - installs ROS Melodic into a CUDA Docker
* `proseco-build.Dockerfile | build` - installs additional depedencies for building (e.g. Eigen, etc.)
## RUN Depedencies
* `proseco-ci.Dockerfile | ci` - installs depedencies for CI
* `proseco-devel.Dockerfile | devel` - installs depedencies for development
* `proseco-ray.Dockerfile | ray` - installs depedencies for parallel evaluation/simulation
