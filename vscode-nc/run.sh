#! /bin/bash
#set -x
set -e

BASEDIR="$( cd "$(dirname "$BASH_SOURCE")/.." ; pwd -P )"
DOCKER_COMPOSE="docker-compose -f $BASEDIR/docker-compose.yml run --rm --service-ports -d "

code="$DOCKER_COMPOSE vscode-nc"

path="${1/#\~/$HOME}"

if [[ -d $path ]]
then
    path=$(realpath $path)
    $DOCKER_COMPOSE -v "$path:/home/dev/workspace" vscode-nc . &

elif [[ -f $path ]]
then
    # resolve any symlinks
    path=$(realpath $path)
    # parent_dir=$(dirname $path)
    parent_dir="$( cd "$(dirname "$path")" ; pwd -P )"
    # cd $parent_dir
    # pwd
    $DOCKER_COMPOSE -v "$parent_dir:/home/dev/workspace" vscode-nc  $(basename $(realpath $path)) &
else
    $code &
fi
