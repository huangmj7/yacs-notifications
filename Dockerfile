FROM ruby:2.5.1-alpine

RUN apk add --update ruby-dev build-base

ENV INSTALL_PATH /usr/src/app/
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile $INSTALL_PATH
RUN bundle install

COPY . $INSTALL_PATH

<<<<<<< HEAD
CMD ruby notifications.rb
=======
CMD ruby notifications.rb
>>>>>>> 3e679419c4a3072f794fa893c2c903334ba24107
