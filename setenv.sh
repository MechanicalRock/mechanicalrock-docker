#! /bin/bash

osx='Darwin'
if [[ `uname` == $osx ]]
then
  echo "OSX environment detected..."
	SCRIPT_DIR="${BASH_SOURCE[0]}"
else
	SCRIPT_DIR=$(realpath $0)
fi
BASEDIR="$( cd "$( dirname "$SCRIPT_DIR" )" >/dev/null 2>&1 && pwd -P )"

DOCKER_COMPOSE="docker-compose -f $BASEDIR/docker-compose.yml run --rm --service-ports"

alias aws="$DOCKER_COMPOSE aws"
alias sam="$DOCKER_COMPOSE sam"
alias npm="$DOCKER_COMPOSE npm"
alias npx="$DOCKER_COMPOSE npx"
alias cfn-lint="$DOCKER_COMPOSE cfn-lint"
alias psql="$DOCKER_COMPOSE psql"
alias mosh="$DOCKER_COMPOSE mosh"
alias cfn-nag="$DOCKER_COMPOSE cfn-nag"
# alias code="$DOCKER_COMPOSE vscode"
alias code="$BASEDIR/vscode/run.sh"
alias code-nc="$BASEDIR/vscode-nc/run.sh"
alias slack="$DOCKER_COMPOSE slack"
alias gimp="$DOCKER_COMPOSE gimp"
alias chrome="$DOCKER_COMPOSE chrome"
