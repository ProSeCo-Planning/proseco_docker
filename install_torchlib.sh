#!/bin/bash
set -e

wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.7.1%2Bcpu.zip
mkdir -p /home/$USER/.local
unzip libtorch-*.zip -d /home/$USER/.local
rm libtorch-*.zip
