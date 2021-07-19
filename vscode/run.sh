#! /bin/bash
#set -x
set -e

BASEDIR="$( cd "$(dirname "$BASH_SOURCE")/.." ; pwd -P )"

# Ensure seccomp file is available
SECCOMP_DIR=~/.vscode/seccomp/
mkdir -p ${SECCOMP_DIR}
cp $BASEDIR/vscode/conf/seccomp/chrome.json ${SECCOMP_DIR}

export MR_DOCKER_BASEDIR=$BASEDIR
DOCKER_COMPOSE="docker-compose -f $BASEDIR/docker-compose.yml run --rm --service-ports -d "

code="$DOCKER_COMPOSE vscode"

path="${1/#\~/$HOME}"

export CURRENT_UID="$(id -u):$(cut -d: -f3 < <(getent group docker))"

if [[ -d $path ]]
then
    path=$(realpath $path)
    $DOCKER_COMPOSE -v "$path:$path" vscode $path 

elif [[ -f $path ]]
then
    # resolve any symlinks
    path=$(realpath $path)
    # parent_dir=$(dirname $path)
    parent_dir="$( cd "$(dirname "$path")" ; pwd -P )"
    # cd $parent_dir
    # pwd
    #$DOCKER_COMPOSE -v "$parent_dir:$parent_dir" vscode  $(basename $(realpath $path)) &

    echo "opening vscode in $parent_dir"

    $DOCKER_COMPOSE -v "$parent_dir:$parent_dir" vscode  $parent_dir &
else
    $code & >/dev/null 2>&1
fi
