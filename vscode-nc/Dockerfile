FROM ubuntu:20.04

ENV USER=dev
# ENV GROUP=developers

# RUN groupadd $GROUP
# RUN useradd -m -G $GROUP $USER
RUN useradd -m $USER

RUN apt-get update \
 && apt-get install -y curl apt-transport-https libgtk2.0-0 libxss1 libasound2 xauth x11-apps dbus git gpg

RUN mkdir /var/run/dbus

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
 && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
 && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN apt-get update \
 && apt-get install -y code \
 && apt-get install -f

RUN cp /usr/lib/x86_64-linux-gnu/libxcb.so.1 /usr/share/code/ \
 && cp /usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0 /usr/share/code/ \
 && sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1 \
 && sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1.1.0

RUN apt-get install -y libx11-xcb-dev \
                       libgl1 \
                       libglvnd-dev

ADD install-js.sh .
RUN chmod +x install-js.sh
RUN /install-js.sh

ADD install-docker.sh /
RUN chmod +x /install-docker.sh && /install-docker.sh

# Install .net-core
ADD install-netcore.sh .
RUN chmod +x install-netcore.sh
RUN /install-netcore.sh

USER $USER

WORKDIR /home/$USER/setup

ADD extensions.txt .

RUN for extension in `cat extensions.txt`; do /usr/bin/code --install-extension $extension; done;

VOLUME /vscode-data

WORKDIR /home/$USER/workspace

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh

USER root
RUN usermod -aG docker $USER
USER $USER




# ENTRYPOINT ["/usr/bin/code", "--verbose", "--user-data-dir", "/vscode-data"]
ENTRYPOINT ["docker-entrypoint.sh"]