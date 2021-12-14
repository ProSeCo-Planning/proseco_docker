FROM karlkurzer/proseco:cuda-ros

# BUILD/RUN Dependencies
RUN apt update && apt install -y \
    apt-transport-https \
    ca-certificates \
    wget \
    zip \
    gcc-10 \
    g++-10 \
    libeigen3-dev \
    swig \
    libcairo2-dev \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

COPY install_torchlib.sh /install_torchlib.sh
COPY install_cue.sh /install_cue.sh
RUN chmod a+rx /ros_entrypoint.sh && bash install_torchlib.sh && bash install_cue.sh
ENV PATH="/root/.local/bin:$PATH" 
