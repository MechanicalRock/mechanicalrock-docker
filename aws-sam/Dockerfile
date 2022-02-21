FROM python:3.11.0a5-alpine

RUN apk add --no-cache bash gawk sed grep bc coreutils git
RUN apk add --no-cache curl gcc

RUN apk update
RUN apk add python3-dev build-base
# RUN apk add --no-cache py-pip
# RUN python -m pip install grpcio-tools

RUN apk add --no-cache libc6-compat libstdc++

RUN pip install aws-sam-cli

ENV SAM_CLI_TELEMETRY=0

WORKDIR /app
ENTRYPOINT '/bin/sh'
