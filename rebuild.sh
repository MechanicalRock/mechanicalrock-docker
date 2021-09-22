#! /bin/bash
set -euo pipefail

for ARG in "$@"
do
  docker tag "mechanicalrock-docker_$ARG:latest" "mechanicalrock-docker_$ARG:prev"
  docker-compose build --no-cache $ARG
done

