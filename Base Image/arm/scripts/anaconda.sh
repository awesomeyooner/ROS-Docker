#!/bin/bash

# Download the Anaconda installer into /tmp

# This contains all Anaconda Versions
# https://repo.anaconda.com/archive/

VERSION="https://repo.anaconda.com/archive/Anaconda3-2025.12-2-Linux-x86_64.sh"
OUTPUT="/tmp/anaconda_installer.sh"

wget ${VERSION} -O ${OUTPUT}
sudo chmod +x ${OUTPUT}
bash ${OUTPUT} -b
source ~/.bashrc
rm ${OUTPUT}
source ~/anaconda3/bin/activate
conda init --all

source ~/.bashrc