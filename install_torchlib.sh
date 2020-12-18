#!/bin/bash
set -e

wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.7.1%2Bcpu.zip
mkdir -p /home/ws/$USER/.local
unzip libtorch-*.zip -d /home/ws/$USER/.local
rm libtorch-*.zip