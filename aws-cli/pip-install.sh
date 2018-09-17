#! /bin/sh

DEV_DEPS="gcc musl-dev linux-headers libffi-dev openssl-dev"

apk update \
&& apk add --no-cache --virtual .pip-deps $DEV_DEPS \
&& rm -rf /var/lib/apt/lists/* \
&& pip install $@ \
&& apk del .pip-deps