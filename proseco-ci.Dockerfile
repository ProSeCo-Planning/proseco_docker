FROM karlkurzer/proseco:cuda-ros

# CI CHECK Dependencies
RUN apt update && apt install -y \
    git \
    clang-10 \
    clang-tidy-10 \
    clang-format-10 \
    cppcheck \
    python3-catkin-lint \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*

# CI TEST Dependencies
RUN apt update && apt install -y \
    python3-pip \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*
    
RUN pip3 install --upgrade pip setuptools
    
COPY requirements.txt /requirements.txt

RUN pip3 install -r /requirements.txt \
    # CLEAN UP
    && rm -rf ~/.cache/pip
