#!/bin/bash -eu

. config/env.sh

sudo docker run -it --rm --link $CLICKHOUSENAME:clickhouse-server \
              yandex/clickhouse-client --host clickhouse-server --multiquery --query \
              "
              DROP DATABASE IF EXISTS $CLICKHOUSEDB;
              DROP USER IF EXISTS $CLICKHOUSEUSER;
              CREATE DATABASE $CLICKHOUSEDB;
              CREATE USER $CLICKHOUSEUSER IDENTIFIED WITH PLAINTEXT_PASSWORD BY '$CLICKHOUSEPASS';
              GRANT ALL PRIVILEGES ON $CLICKHOUSEDB.* TO $CLICKHOUSEUSER;
              "