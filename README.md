# Overview
## BUILD Dependencies
* `cuda-ros.Dockerfile | cuda-ros` - installs ROS Melodic into a CUDA Docker
* `proseco-build.Dockerfile | build` - installs additional depedencies for building (e.g. Eigen, etc.)
## RUN Depedencies
* `proseco-ci.Dockerfile | ci` - installs depedencies for CI
* `proseco-devel.Dockerfile | devel` - installs depedencies for development
* `proseco-ray.Dockerfile | ray` - installs depedencies for parallel evaluation/simulation

## Building
1. `git clone https://github.com/ProSeCo-Planning/proseco_docker.git && cd proseco_docker`
1. `sudo docker build -f <file_name> -t karlkurzer/proseco:<tag_name> .`
1. `sudo docker push karlkurzer/proseco:<tag_name>`
