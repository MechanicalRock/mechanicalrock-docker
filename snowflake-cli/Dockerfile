FROM "python:3.7-slim-stretch"

ARG SNOWFLAKE_DOWNLOAD
RUN apt-get update && apt-get install -y --no-install-recommends  curl
RUN mkdir /app && curl -o /app/snowflake.sh $SNOWFLAKE_DOWNLOAD

WORKDIR /app

RUN chmod 755 snowflake.sh && SNOWSQL_DEST=/app SNOWSQL_LOGIN_SHELL=/bin/bash ./snowflake.sh && /app/snowsql

ENTRYPOINT /app/snowsql -a $SNOWFLAKE_ACCOUNT -u $SNOWFLAKE_USER
