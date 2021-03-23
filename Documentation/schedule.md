For schedule we used `whenever gem`
    https://github.com/javan/whenever

To write your crontab file for your jobs, execute this command:
$ whenever --update-crontab

To set environment:
At development:
$ whenever --update-crontab --set environment='development'

To edit crontab:
$ crontab -e

To list cron jobs:
$ crontab -l

To remove cron jobs:
$ crontab -r

Example schedule.rb file:
every :sunday, at: '12pm' do # Use any day of the week or :weekend, :weekday
  runner "Task.do_something_great"
end

Here, Task is model and do_something_great is method of that model.

every 1.day, at: '4:30 am' do
  runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
end
