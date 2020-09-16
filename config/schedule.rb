env :PATH, ENV['PATH']
set :environment, "development"
set :output, "log/cron.log"

every :friday, at: '6:00 pm' do
  rake 'schedule_weekly:update'
end