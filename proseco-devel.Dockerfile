FROM karlkurzer/proseco:build

# DEV Dependencies
RUN apt update && apt install -y \
    # TOOLS
    tmux \
    vim \
    git \
    # PYTHON
    python3-pip \
    python3-venv \
    python3-tk \
    # C++
    gdb \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*
    
RUN pip3 install --upgrade pip setuptools
    # CLEAN UP
    && rm -rf ~/.cache/pip
