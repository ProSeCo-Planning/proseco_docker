FROM karlkurzer/proseco:cuda-ros

# BUILD/RUN Dependencies
RUN apt update && apt install -y \
    libeigen3-dev \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*