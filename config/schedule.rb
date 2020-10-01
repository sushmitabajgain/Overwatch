env :PATH, ENV['PATH']
# set :environment, "development"
set :output, "log/cron.log"

every :friday, at: '9:00 pm' do
  rake 'schedule_weekly:update'
end

# every 1.minutes do
#   rake 'schedule_weekly:update'
# end