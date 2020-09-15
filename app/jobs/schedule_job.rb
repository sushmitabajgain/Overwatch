class ScheduleJob < ApplicationJob
  @queue = :schedule

  def perform(sn, status, project, start_date, end_date, extended_date, notes, no_of_resources, no_of_milestone, completed_milestone, missed_milestone, week)
    Project.create(sn: sn, status: status, project: project, start_date: start_date, end_date: end_date, extended_date: extended_date, notes: notes, week_id: week, no_of_resources: no_of_resources, no_of_milestone: no_of_milestone, completed_milestone: completed_milestone, missed_milestone: missed_milestone )
  end
end