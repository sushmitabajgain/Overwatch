ARG IMAGE=ruby:2.6.5-alpine3.11

FROM $IMAGE

RUN apk update && apk upgrade && apk add \
    build-base \
    linux-headers \
    tzdata \
    git \
    postgresql-dev \
    postgresql-client \
    nodejs \
    yarn && \
    gem install bundler

ENV SECRET_KEY_BASE e622e65737f224deeb1b43ffe4ac2cb49c7b1142c58b711bc9a9f91c12dedc8b5b7279a7cfa90edcb6f25d380cdb17ecbe452a7915903cc4cbd89e4e2bf61a80

WORKDIR /opt/overwatch

COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./

RUN bundle install

COPY . ./

ENV RAILS_ENV=production

RUN yarn install --check-files

RUN RAILS_ENV=production NODE_ENV=production bundle exec rails assets:precompile

RUN yarn install --check-files

RUN RAILS_ENV=production RACK_ENV=production NODE_ENV=production bin/webpack

RUN RAILS_ENV=production bundle exec rake webpacker:compile

EXPOSE 3000

CMD sh -c "/bin/sh start.sh"