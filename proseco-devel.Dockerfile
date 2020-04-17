FROM karlkurzer/proseco:build

# DEV Dependencies
RUN apt update && apt install -y \
    python3-pip \
    python3-venv \
    tmux \
    vim \
    git
