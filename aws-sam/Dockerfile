FROM node:8.10

WORKDIR /app

# install aws-cli
RUN apt-get update
RUN apt-get install -y  python-pip \
                        python-dev \
                        apt-transport-https \
                        ca-certificates \
                        curl \
                        gnupg2 \
                        software-properties-common

RUN pip install -U awscli setuptools backports.functools_lru_cache && \
    pip install pathlib2 && pip install aws-sam-cli

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get install -y docker-ce

ENTRYPOINT '/bin/bash'
