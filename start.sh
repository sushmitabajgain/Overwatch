#!/bin/sh
bundle exec rake db:migrate
foreman start
whenever --update-crontab