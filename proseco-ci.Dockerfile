FROM karlkurzer/proseco:build

# CI CHECK Dependencies
RUN apt update && apt install -y \
    clang \
    clang-tidy \
    clang-format \
    cppcheck \
    python-catkin-lint \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*

# CI TEST Dependencies
RUN apt update && apt install -y \
    python3-pip \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip && \
    pip3 install \
    PyYAML \
    rospkg \
    defusedxml \
    netifaces \
    ray \
    numpy \
    pandas \
    tqdm \
    black \
    # CLEAN UP
    && rm -rf ~/.cache/pip