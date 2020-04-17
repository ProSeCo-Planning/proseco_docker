FROM karlkurzer/proseco:tf2-devel-gpu

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    libtool \
    cmake
    
# Configure Tensorflow installation
RUN git clone https://github.com/tensorflow/tensorflow.git && \
    cd tensorflow && \
    git checkout r2.0 && \
    ./configure

# Build Tensorflow libraries
RUN cd /tensorflow && \ 
    bazel build //tensorflow:libtensorflow_cc.so && \
    bazel build //tensorflow:libtensorflow_framework.so

RUN cd /tensorflow && ./tensorflow/contrib/makefile/download_dependencies.sh

# Build Protobuf
RUN cd /tensorflow/tensorflow/contrib/makefile/downloads/protobuf/ && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install
