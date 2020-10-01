#!/bin/sh
bundle exec rake db:create db:migrate
foreman start
whenever --update-crontab