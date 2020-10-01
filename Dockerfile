ARG IMAGE=ruby:2.6.5-alpine3.11

FROM $IMAGE

RUN apk update \
    && apk add build-base git postgresql-dev postgresql-client yarn tzdata

WORKDIR /opt/overwatch

COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./
RUN gem install bundler

RUN bundle install

RUN yarn install --check-files

COPY . ./

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD sh -c "/bin/sh start.sh"