FROM karlkurzer/proseco:build

# CI CHECK Dependencies
RUN apt update && apt install -y \
    clang \
    clang-tidy \
    clang-format \
    cppcheck \
    python-catkin-lint

# CI TEST Dependencies
RUN apt update && apt install -y \
    python3-pip

RUN pip3 install --upgrade pip && pip3 install PyYAML rospkg defusedxml netifaces
