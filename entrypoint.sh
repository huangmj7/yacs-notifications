nohup bundler exec iodine -p 4800 -www ./public -v > iodine.out 2>&1 &
bundle exec karafka server
