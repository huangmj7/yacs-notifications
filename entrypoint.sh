nohup bundler exec iodine -p 4860 -t 1 w 1 -www./public -v > iodine.out 2>&1 &
bundle exec karafka server 
