#!/bin/bash
set -euo pipefail

# https://linuxize.com/post/how-to-install-python-3-7-on-ubuntu-18-04/
apt-get install -y software-properties-common

add-apt-repository -y ppa:deadsnakes/ppa

#apt-get install -y python3-pip python3-dev
apt-get install -y python3-pip python3.8 python3.8-dev 

cd /usr/local/bin
ln -s /usr/bin/python3.8 python
pip3 install --upgrade pip

