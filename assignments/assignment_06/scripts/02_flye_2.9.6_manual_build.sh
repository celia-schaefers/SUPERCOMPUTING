#!/bin/bash
set -euo pipefail
mkdir -p ~/programs
cd ~/programs
if [ ! -d Flye ]; then
  git clone --branch 2.9.6 --depth 1 https://github.com/mikolmogorov/Flye.git
fi
cd Flye
make
