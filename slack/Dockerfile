# TODO - slim down
FROM ubuntu

ENV SLACK_VERSION=3.3.1-amd64

ENV USER=dev
RUN useradd -m $USER

WORKDIR /setup

# TODO - multi stage container to separate dependencies and reduce size
# wget is not required for final packages
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://downloads.slack-edge.com/linux_releases/slack-desktop-${SLACK_VERSION}.deb && \
    apt install -y ./slack-desktop-${SLACK_VERSION}.deb && \
    apt-get install -y libasound2

USER $USER

# ENTRYPOINT [ "slack" ]
ENTRYPOINT [ "bash" ]