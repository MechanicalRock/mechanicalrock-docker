#! /bin/bash
set -euo pipefail

for ARG in "$@"
do
  docker tag "mechanicalrock/docker-$ARG:latest" "mechanicalrock/docker-$ARG:prev"
  docker-compose build --no-cache $ARG
done

