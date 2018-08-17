FROM python:2.7-alpine

RUN pip install awscli
RUN apk add groff

#ENV PAGER='busybox less' aws cli doesn't work properly with busybox less (bold titles look garbage), but at least it doesn't crash..
#ENV PAGER='more' #is pretty annoying..
#So maybe just use cat as default..
ENV PAGER='cat' 

WORKDIR /app

ENTRYPOINT aws