#!/usr/bin/env bash

set -e



rm -f /myapp/tmp/pids/server.pid

DB_EXISTS=$(rake db:exists)
if DB_EXISTS; then
  rails db:create db:migrate db:seed
else
  rails db:migrate
fi

