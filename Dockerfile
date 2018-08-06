FROM ruby:2.5.1-alpine

RUN apk add --update ruby-dev build-base

ENV INSTALL_PATH /usr/src/app/
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile $INSTALL_PATH
RUN bundle install

COPY . $INSTALL_PATH

CMD ruby notifications.rb
