# Docker setup for Snowflake CLI (_Snowsql_)

Downloads and configures the _SnowSQL_  CLI app in a docker container

This is often a preferred solution to installing proprietary binaries on your own device

## Version

You can set the _SnowSQL_ download version in the `.env` file.

This is actually only the bootstrap loader - the first building of the docker image will download the most current version anyway.

To upgrade the _SnowSQL_ version, consider updating the bootstrap script location above, or rebuild the container.

## Snowflake Account, username and password

You must set your Snowflake account name and username in two environment variables, `SNOWFLAKE_ACCOUNT` and `SNOWFLAKE_USER`. These are passed to the CLI directly, however you will be prompted by _SnowSQL_

## Running the CLI app, _SnowSQL_

`$ SNOWFLAKE_ACCOUNT=<youraccount> SNOWFLAKE_USER=<youruser> docker-compose run snowflake`

Alternatively just export those environment variables (`SNOWFLAKE_ACCOUNT / SNOWFLAKE_USER`) in your shell, and run `docker-compose run snowflake`