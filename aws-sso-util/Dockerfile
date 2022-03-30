FROM python:3.11.0a6-slim-buster

RUN pip install aws-sso-util

RUN useradd -m dev
USER dev

ENTRYPOINT [ "aws-sso-util" ]
