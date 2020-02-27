#! /bin/bash

osx='Darwin'
if [[ uname -eq $osx ]]
then
	SCRIPT_DIR="${BASH_SOURCE[0]}"
else
	SCRIPT_DIR=$(realpath $0)
fi
BASEDIR="$( cd "$(dirname "$SCRIPT_DIR")" ; pwd -P )"

DOCKER_COMPOSE="docker-compose -f $BASEDIR/docker-compose.yml run --rm "

cat <<EOM >$HOME/bin/aws
	$DOCKER_COMPOSE aws \$@
EOM

cat <<EOM >$HOME/bin/aws2
	$DOCKER_COMPOSE aws2 \$@
EOM

cat <<EOM >$HOME/bin/sam
	$DOCKER_COMPOSE sam \$@
EOM
cat <<EOM >$HOME/bin/npm
	$DOCKER_COMPOSE npm \$@
EOM
cat <<EOM >$HOME/bin/npx
	$DOCKER_COMPOSE npx \$@
EOM
cat <<EOM >$HOME/bin/cfn-lint
	$DOCKER_COMPOSE cfn-lint \$@
EOM
cat <<EOM >$HOME/bin/psql
	$DOCKER_COMPOSE psql \$@
EOM
cat <<EOM >$HOME/bin/mosh
	$DOCKER_COMPOSE mosh \$@
EOM
cat <<EOM >$HOME/bin/cfn-nag
	$DOCKER_COMPOSE cfn-nag \$@
EOM
cat <<EOM >$HOME/bin/code
	$BASEDIR/vscode/run.sh \$@
EOM
cat <<EOM >$HOME/bin/slack
	$DOCKER_COMPOSE slack \$@
EOM
cat <<EOM >$HOME/bin/gimp
	$DOCKER_COMPOSE gimp \$@
EOM
cat <<EOM >$HOME/bin/chrome
	$DOCKER_COMPOSE chrome \$@
EOM

## THIS LINE SHOULD BE LAST
chmod u+x $HOME/bin/*
