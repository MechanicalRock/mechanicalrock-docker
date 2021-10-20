# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.194.3/containers/python-3/.devcontainer/base.Dockerfile

# [Choice] Python version: 3, 3.9, 3.8, 3.7, 3.6
ARG VARIANT="3.9"
FROM mcr.microsoft.com/vscode/devcontainers/python:0-${VARIANT}

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="14"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>


# FROM ubuntu

ENV USER=vscode
# RUN useradd -m $USER

# RUN apt-get update \
#  && apt-get install -y curl apt-transport-https libgtk2.0-0 libxss1 libasound2 xauth x11-apps dbus git gpg

# RUN mkdir /var/run/dbus

# RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
#  && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
#  && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# RUN apt-get update \
#  && apt-get install -y code \
#  && apt-get install -f

# RUN cp /usr/lib/x86_64-linux-gnu/libxcb.so.1 /usr/share/code/ \
#  && cp /usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0 /usr/share/code/ \
#  && sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1 \
#  && sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1.1.0

# RUN apt-get install -y libx11-xcb-dev \
#                        libgl1 \
#                        libglvnd-dev

USER "${USER}"
# WORKDIR /home/$USER/setup
WORKDIR /setup
ADD --chown=vscode setup/ .
RUN chmod --recursive +x *.sh && /bin/bash -c ./install.sh



# ADD install-vscode.sh .
# RUN chmod +x install-vscode.sh && /bin/bash -c ./install-vscode.sh
# # RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
# #   install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ \
# #   sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' \
# #   rm -f packages.microsoft.gpg \
# #   apt install apt-transport-https \
# #   apt update \
# #   apt install code

# USER vscode

# ADD extensions.txt .
# RUN whoami
# RUN for extension in `cat extensions.txt`; do /usr/bin/code --install-extension $extension; done;

# Provides a 2-stage update, for faster bulding
# Move extensions from extensions2.txt to extensions.txt once built
# ADD extensions2.txt .

# RUN for extension in `cat extensions2.txt`; do /usr/bin/code --install-extension $extension; done;


VOLUME /vscode-data

# WORKDIR /home/$USER/workspace

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh


ENTRYPOINT ["docker-entrypoint.sh"]
