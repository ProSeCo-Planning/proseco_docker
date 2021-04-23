FROM karlkurzer/proseco:cuda-ros

# BUILD/RUN Dependencies
RUN apt update && apt install -y \
    wget \
    zip \
    gcc-10 \
    g++-10 \
    libeigen3-dev \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/* 

COPY install_torchlib.sh /install_torchlib.sh
COPY install_swig.sh /install_swig.sh
RUN chmod a+rx /ros_entrypoint.sh && bash install_torchlib.sh && bash install_swig.sh
