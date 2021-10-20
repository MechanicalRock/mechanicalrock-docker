#! /bin/bash
set -euo pipefail

echo "############"
echo "### Installing AWS CLI v2"
echo "############"

sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y unzip
sudo apt-get install -y gnupg2
INSTALL_PKG=https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

curl "$INSTALL_PKG" -o "awscliv2.zip" && \
   gpg --import ./gpg.key && \
   curl -o awscliv2.sig "${INSTALL_PKG}.sig" && \
   gpg --verify awscliv2.sig awscliv2.zip && \
   unzip awscliv2.zip && \
   sudo ./aws/install

pip3 install cfn-lint
