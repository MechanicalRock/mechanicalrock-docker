#!/bin/bash
set -euo pipefail

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt-get update
sudo apt install -y apt-transport-https libasound2 libxshmfence1
sudo apt-get update
sudo apt install -y code

osx='Darwin'
if [[ uname == $osx ]]
then
  echo "OSX environment detected..."
	SCRIPT_DIR="${BASH_SOURCE[0]}"
else
	SCRIPT_DIR=$(dirname $(realpath $0))
fi

echo "Current User: $(whoami)"

for extension in `cat ${SCRIPT_DIR}/extensions.txt`; do /usr/bin/code --install-extension $extension; done;