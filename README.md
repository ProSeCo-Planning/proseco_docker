# Overview
## BUILD Dependencies
* `cuda-ros.Dockerfile | cuda-ros` - installs ROS Melodic into a CUDA Docker
* `proseco-build.Dockerfile | build` - installs additional depedencies for building (e.g. Eigen, etc.)
## RUN Depedencies
* `proseco-ci.Dockerfile | ci` - installs depedencies for CI
* `proseco-devel.Dockerfile | devel` - installs depedencies for development
* `proseco-ray.Dockerfile | ray` - installs depedencies for parallel evaluation/simulation
