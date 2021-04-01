FROM ubuntu

ENV USER=dev
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

WORKDIR /setup
ADD setup/ .
RUN chmod --recursive +x *.sh && /bin/bash -c ./install.sh && rm -rf /setup

# ADD install-js.sh .
# RUN chmod +x install-js.sh
# RUN /install-js.sh

# ADD install-docker.sh /
# RUN chmod +x /install-docker.sh && /install-docker.sh

# ADD install-python.sh /
# RUN chmod +x /install-python.sh && /install-python.sh

# ADD intall-git-remote-codecommit.sh /
# RUN chmod +x /intall-git-remote-codecommit.sh && /intall-git-remote-codecommit.sh

# # ADD install-chromium.sh /
# # RUN chmod +x /install-chromium.sh && /install-chromium.sh

# WORKDIR /setup/aws-cli
# ADD install-awscli-v2.sh .
# COPY awscli/gpg.key .
# RUN chmod +x ./install-awscli-v2.sh && ./install-awscli-v2.sh

# ADD install-sam-cli.sh .
# RUN chmod +x ./install-sam-cli.sh && ./install-sam-cli.sh

USER $USER

WORKDIR /home/$USER/setup

ADD extensions.txt .

RUN for extension in `cat extensions.txt`; do /usr/bin/code --install-extension $extension; done;

# Provides a 2-stage update, for faster bulding
# Move extensions from extensions2.txt to extensions.txt once built
ADD extensions2.txt .

RUN for extension in `cat extensions2.txt`; do /usr/bin/code --install-extension $extension; done;


VOLUME /vscode-data

WORKDIR /home/$USER/workspace

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh


# USER root
# RUN usermod -aG docker $USER
# ADD install-browser.sh /
# RUN chmod +x /install-browser.sh && /install-browser.sh
# USER $USER

ENTRYPOINT ["docker-entrypoint.sh"]
