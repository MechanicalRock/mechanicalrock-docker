#! /bin/bash
set -euo pipefail

for ARG in "$@"
do
  docker tag "mechanicalrockdocker_$ARG:latest" "mechanicalrockdocker_$ARG:prev"
  docker-compose build --no-cache $ARG
done

