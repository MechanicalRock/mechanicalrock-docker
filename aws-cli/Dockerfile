FROM python:2.7-alpine

#ENV PAGER='busybox less' aws cli doesn't work properly with busybox less (bold titles look garbage), but at least it doesn't crash..
#ENV PAGER='more' #is pretty annoying..
#So maybe just use cat as default..
ENV PAGER='cat' 

RUN apk add groff

WORKDIR /setup

ADD ./pip-install.sh .
RUN ./pip-install.sh awscli fedcred

# ENV USER=dev
# RUN useradd -m $USER

# USER $USER

WORKDIR /app

ENTRYPOINT aws