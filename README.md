# Overview
## BUILD Dependencies
* `cuda-ros.Dockerfile | cuda-ros` - installs ROS Melodic into a CUDA Docker
* `proseco-build.Dockerfile | build` - installs additional depedencies for building (e.g. Eigen, etc.)
## RUN Depedencies
* `proseco-ci.Dockerfile | ci` - installs depedencies for CI
* `proseco-devel.Dockerfile | devel` - installs depedencies for development

## Building
1. `git clone https://github.com/ProSeCo-Planning/proseco_docker.git && cd proseco_docker`
2. `./build_docker.sh` to build and push all tags or `docker build -f <file_name> -t karlkurzer/proseco:<tag_name> .` and `docker push karlkurzer/proseco:<tag_name>`
