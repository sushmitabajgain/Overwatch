#!/bin/sh
bundle exec rake db:migrate db:seed
foreman start
whenever --update-crontab