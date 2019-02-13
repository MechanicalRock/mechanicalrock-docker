FROM debian:stretch-slim

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV SLACK_VERSION=3.3.7-amd64

ENV USER=dev
RUN useradd -m $USER

WORKDIR /setup

RUN apt-get update \
    && \
    apt-get install -y  apt-transport-https \
                        ca-certificates \
                        gnupg \
                        locales \
                        wget --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

RUN wget https://downloads.slack-edge.com/linux_releases/slack-desktop-${SLACK_VERSION}.deb && \
    apt-get update && \
    apt-get install -y ./slack-desktop-${SLACK_VERSION}.deb --no-install-recommends \
    && \
    apt-get install -y  --no-install-recommends \
                        libasound2 \
                        libgtk-3-0 \
                        libx11-xcb1 \
                        libxkbfile1 \
    && \
    rm -rf /var/lib/apt/lists/* \
    && \
    rm ./slack-desktop-${SLACK_VERSION}.deb

USER $USER

ENTRYPOINT [ "slack" ]