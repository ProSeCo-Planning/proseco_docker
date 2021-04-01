#!/bin/bash
set -e

wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.8.1%2Bcpu.zip
mkdir -p /home/$USER/.local
unzip libtorch-*.zip -d ~/.local
rm libtorch-*.zip
