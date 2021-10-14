#!/bin/bash

wget -O cue.tar.gz https://github.com/cue-lang/cue/releases/download/v0.4.0/cue_v0.4.0_linux_amd64.tar.gz
mkdir -p ~/.local/bin/ && tar -zxvf cue.tar.gz -C ~/.local/bin/
rm -rf cue.tar.gz
