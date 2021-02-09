FROM amazon/aws-cli

ENV USER=dev

RUN yum update -y && \
    yum install shadow-utils.x86_64 -y

RUN useradd --uid 1000 $USER
#RUN groupadd --gid 1000 $USER && useradd --groups $USER --uid 1000 $USER

USER $USER

WORKDIR /app

ENTRYPOINT aws
