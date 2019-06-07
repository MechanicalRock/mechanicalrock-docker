#!/bin/bash
set -e

# https://dotnet.microsoft.com/download/linux-package-manager/ubuntu18-04/sdk-current
apt-get install -y wget

wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

add-apt-repository universe
apt-get install -y apt-transport-https
apt-get update
apt-get install -y dotnet-sdk-2.2