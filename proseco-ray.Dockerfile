FROM karlkurzer/proseco:cuda-ros

# RUN Dependencies
RUN apt update && apt install -y \
    git \
    ssh-client \
    redis \
    # PYTHON
    python3-pip \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*
    
RUN python3 -m pip install --upgrade pip setuptools

RUN python3 -m pip install ray numpy pandas rospkg tqdm \
    # CLEAN UP
    && rm -rf ~/.cache/pip