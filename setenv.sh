#! /bin/bash

BASEDIR="$( cd "$(dirname "$BASH_SOURCE")" ; pwd -P )"

DOCKER_COMPOSE="docker-compose -f $BASEDIR/docker-compose.yml run --rm "

alias aws="$DOCKER_COMPOSE aws"
alias npm="$DOCKER_COMPOSE npm"
alias cfn-lint="$DOCKER_COMPOSE cfn-lint"
alias psql="$DOCKER_COMPOSE psql"
alias mosh="$DOCKER_COMPOSE mosh"