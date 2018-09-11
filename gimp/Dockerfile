# https://github.com/jamesnetherton/dockerfiles/blob/master/gimp/Dockerfile
FROM alpine

RUN apk add --no-cache --update gimp ghostscript-fonts dbus-x11

ENV USER=dev
RUN useradd -m $USER


ENTRYPOINT [ "gimp" ]