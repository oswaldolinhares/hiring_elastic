FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libpq-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
