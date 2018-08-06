FROM ruby:2.5.1-alpine

RUN apk add --update ruby-dev build-base

ENV INSTALL_PATH /usr/src/app/
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile $INSTALL_PATH
RUN bundle install

COPY . $INSTALL_PATH


#ENV ENTRY bundle exec karafka server 
#ENV ENTRY bundle exec iodine -p 4800 -t 1 -w 1 -www ./public 
ENV ENTRY ruby notifications.rb -p 4800 -t 1 -w 1 -www ./public && bundle exec karafka server
CMD $ENTRY
