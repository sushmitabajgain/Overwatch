env :PATH, ENV['PATH']
set :environment, "development"
set :output, "log/cron.log"

every 1.hour do
  rake 'schedule_weekly:update'
end