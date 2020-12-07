rm -f tmp/pids/server.pid
bundle exec rails s -b "0.0.0.0" --port "3000"
bundle exec rake db:exists; DB_EXISTS=$?; [[ $DB_EXISTS = 1 ]] && (rails db:create db:migrate db:seed) || (rails db:migrate)