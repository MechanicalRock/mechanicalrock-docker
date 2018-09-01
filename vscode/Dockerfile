FROM ubuntu

ENV USER=dev
ENV GROUP=developers

RUN groupadd $GROUP
RUN useradd -m -G $GROUP $USER

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

RUN apt-get install -y libx11-xcb-dev

ADD install-js.sh .
RUN chmod +x install-js.sh
RUN /install-js.sh

USER $USER

WORKDIR /home/$USER/setup

ADD extensions.txt .

RUN for extension in `cat extensions.txt`; do /usr/bin/code --install-extension $extension; done;

WORKDIR /home/$USER/workspace

ENTRYPOINT ["/usr/bin/code", "--verbose"]
