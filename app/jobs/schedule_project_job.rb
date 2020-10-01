class ScheduleProjectJob < ApplicationJob
  @queue = :project

  def perform(project, project_health, project_timeline, workload, pending_raid, milestone_status, notes, week)
    Project.create(project: project, project_health: project_health, project_timeline: project_timeline, workload: workload, pending_raid: pending_raid, milestone_status: milestone_status, notes: notes, week: week)
  end
end