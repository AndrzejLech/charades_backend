#!/bin/sh
DB_EXISTS=$(rake db:exists)
if DB_EXISTS; then
  rails db:create db:migrate db:seed
else
  rails db:migrate
fi
exit
