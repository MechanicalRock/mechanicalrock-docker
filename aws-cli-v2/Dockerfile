FROM ubuntu:18.04
#FROM python:3.8-alpine

#RUN pip install awscli
#RUN apk add groff

#ENV PAGER='busybox less' aws cli doesn't work properly with busybox less (bold titles look garbage), but at least it doesn't crash..
#ENV PAGER='more' #is pretty annoying..
#So maybe just use cat as default..
#ENV PAGER='cat' 

#RUN apk add groff
#RUN apk add --no-cache gnupg
#RUN apk add --no-cache curl
RUN apt-get update && apt-get install -y curl
RUN apt-get install -y unzip
RUN apt-get install -y gnupg2
ENV INSTALL_PKG=https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

WORKDIR /setup 
COPY ./gpg.key .
RUN curl "$INSTALL_PKG" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    gpg --import ./gpg.key && \
    curl -o awscliv2.sig "${INSTALL_PKG}.sig" && \
    gpg --verify awscliv2.sig awscliv2.zip
  

ENV USER=dev
# RUN addgroup -g 1000 -S $USER && adduser -u 1000 -S $USER -h /home/dev -G $USER
RUN addgroup -gid 1000 $USER && adduser -uid 1000 -gid 1000 --home /home/dev $USER
USER $USER

WORKDIR /app

ENTRYPOINT aws
