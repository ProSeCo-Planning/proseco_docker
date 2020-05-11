FROM karlkurzer/proseco:build

# DEV Dependencies
RUN apt update && apt install -y \
    # TOOLS
    tmux \
    vim \
    git \
    htop \
    ssh-client \
    # PYTHON
    python3-pip \
    python3-venv \
    python3-tk \
    # C++
    gdb \
    clang-format \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*
    
RUN pip3 install --upgrade pip setuptools

COPY requirements.txt /requirements.txt

RUN python3 -m pip install -r /requirements.txt \
    # CLEAN UP
    && rm -rf ~/.cache/pip
