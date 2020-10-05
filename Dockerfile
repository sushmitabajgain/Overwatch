ARG IMAGE=ruby:2.6.5-alpine3.11

FROM $IMAGE

RUN apk update \
    && apk add build-base git postgresql-dev postgresql-client yarn tzdata

WORKDIR /opt/overwatch

COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./
RUN gem install bundler

RUN bundle install

#RUN yarn install --check-files

COPY . ./
ENV SECRET_KEY_BASE e622e65737f224deeb1b43ffe4ac2cb49c7b1142c58b711bc9a9f91c12dedc8b5b7279a7cfa90edcb6f25d380cdb17ecbe452a7915903cc4cbd89e4e2bf61a80
ENV RAILS_ENV production
ENV NODE_ENV production
RUN yarn install --check-files
RUN bin/webpack



RUN RAILS_ENV=production bundle exec rake assets:precompile
RUN RAILS_ENV=production bundle exec rails webpacker:install

EXPOSE 3000

CMD sh -c "/bin/sh start.sh"