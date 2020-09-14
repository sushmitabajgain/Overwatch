namespace :schedule_weekly do
  desc "TODO"
  task update: :environment do
    Project.get_worksheet()
  end
end
