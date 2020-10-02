# OverWatch 

## Installation

### Requirements

* UNIX based Operation System
* rbenv
* Ruby 2.6.5 and up
* Bundler 2.1.4
* Rails 6.0.3.3
* Nodejs 12.18.3 and up
* Yarn 1.22.5 and up
* Postgresql 10 and up

## Developing
```shell
git clone git@git.gurzu.net:gurzu/Overwatch.git
cd Overwatch
bundle install
yarn install
bundle exec rake db:create db:migrate
foreman start
whenever --update-crontab
```

In browser of choice, visit localhost:3000.

To stop the process, press `ctrl+c`.

## Building

This project is based on **Rails**. Directory structure is standard rails app directory.
For the frontend, **Vuejs** is used. The entry point `application.js` resides on `app/javascript/packs/`.
Necessary components are defined in `app/javascript/components/`.

## Copyright

All rights reserved to Gurzu. Inc.
