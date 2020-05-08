FROM karlkurzer/proseco:tf2-devel-gpu-build AS builder

RUN mkdir -p /tmp/tensorflow/lib/ && \
    cp -P /tensorflow/bazel-bin/tensorflow/libtensorflow_cc* /tmp/tensorflow/lib/. && \
    cp -P /tensorflow/bazel-bin/tensorflow/libtensorflow_framework* /tmp/tensorflow/lib/.

RUN mkdir -p /tmp/tensorflow/include/ && \
    cd /tensorflow/bazel-genfiles/ && \
    find . -type f -name '*.hpp' -o -name '*.h' -exec cp --parents \{\} /tmp/tensorflow/include \;

FROM karlkurzer/proseco:cuda-ros
RUN mkdir -p /usr/local/lib/tensorflow && \
    mkdir -p /usr/local/include/tensorflow

# COPY TENSORFLOW DEPENDENCIES
# copy libs
COPY --from=builder /tmp/tensorflow/lib/ /usr/local/lib/tensorflow
COPY --from=builder /usr/local/lib/libprotobuf.a /usr/local/lib/tensorflow
# copy includes
COPY --from=builder /tmp/tensorflow/include/ /usr/local/include/tensorflow
COPY --from=builder /tensorflow/tensorflow/cc /usr/local/include/tensorflow/tensorflow/cc
COPY --from=builder /tensorflow/tensorflow/core /usr/local/include/tensorflow/tensorflow/core
COPY --from=builder /tensorflow/third_party /usr/local/include/tensorflow/third_party
COPY --from=builder /usr/local/include/google /usr/local/include/tensorflow/google
COPY --from=builder /tensorflow/tensorflow/contrib/makefile/downloads/absl/absl /usr/local/include/tensorflow/absl
COPY --from=builder /tensorflow/bazel-tensorflow/external/eigen_archive/unsupported /usr/local/include/tensorflow
COPY --from=builder /tensorflow/bazel-tensorflow/external/eigen_archive/Eigen /usr/local/include/tensorflow

# BUILD/RUN Dependencies
RUN apt update && apt install -y \
    libeigen3-dev \
    # CLEAN UP
    && rm -rf /var/lib/apt/lists/*
