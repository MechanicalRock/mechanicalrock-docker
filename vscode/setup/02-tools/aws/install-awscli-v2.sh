#! /bin/bash
set -euo pipefail

apt-get update && apt-get install -y curl
apt-get install -y unzip
apt-get install -y gnupg2
INSTALL_PKG=https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

curl "$INSTALL_PKG" -o "awscliv2.zip" && \
   unzip awscliv2.zip && \
   ./aws/install && \
   gpg --import ./gpg.key && \
   curl -o awscliv2.sig "${INSTALL_PKG}.sig" && \
   gpg --verify awscliv2.sig awscliv2.zip

pip install cfn-lint
