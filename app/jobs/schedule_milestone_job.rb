class ScheduleMilestoneJob < ApplicationJob
  @queue = :milestone

  def perform(project, no_of_milestones, missed_milestones, completed_milestones, week)
    Milestone.create(project: project, no_of_milestones: no_of_milestones, missed_milestones: missed_milestones, completed_milestones: completed_milestones, week: week)
  end
end
