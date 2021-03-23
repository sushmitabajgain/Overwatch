namespace :schedule_weekly do
  desc "TODO"
  task update: :environment do
    ScheduleSpreadsheet.get_worksheet()
  end
end
