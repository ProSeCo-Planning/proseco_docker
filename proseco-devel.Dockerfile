FROM karlkurzer/proseco:build

# DEV Dependencies
RUN apt update && apt install -y \
    python3-pip \
    python3-venv \
    python3-tk \
    tmux \
    vim \
    git && \
    pip3 install -U pip
