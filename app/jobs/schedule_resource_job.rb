class ScheduleResourceJob < ApplicationJob
  @queue = :resource

  def perform(project, no_of_resources, week)
    Resource.create(project: project, no_of_resources: no_of_resources, week: week)
  end
end