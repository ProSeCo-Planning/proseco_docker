FROM karlkurzer/proseco:cuda-ros

# BUILD/RUN Dependencies
RUN apt update && apt install -y \
    wget \
    zip \
    libeigen3-dev \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/* 

COPY install_torchlib.sh /install_torchlib.sh
RUN chmod a+rx /ros_entrypoint.sh && bash install_torchlib.sh