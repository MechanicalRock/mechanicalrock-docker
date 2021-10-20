#! /bin/bash
set -euo pipefail


osx='Darwin'
if [[ uname == $osx ]]
then
  echo "OSX environment detected..."
	SCRIPT_DIR="${BASH_SOURCE[0]}"
else
	SCRIPT_DIR=$(dirname $(realpath $0))
fi

echo "Installing base tools: ${SCRIPT_DIR}"

for INSTALL_SCRIPT in $(find ${SCRIPT_DIR} -name "install-*.sh")
do
	echo "install: ${INSTALL_SCRIPT}"
	INSTALL_DIR=$(dirname $(realpath $INSTALL_SCRIPT))
	cd $INSTALL_DIR
	/bin/bash  ${INSTALL_SCRIPT}
	cd ${SCRIPT_DIR}
done

