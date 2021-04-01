FROM python:3

RUN pip install aws-sso-util

RUN useradd -m dev
USER dev

ENTRYPOINT [ "aws-sso-util" ]
