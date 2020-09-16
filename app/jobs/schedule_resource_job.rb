class ScheduleResourceJob < ApplicationJob
  @queue = :resource

  def perform(multiple, name, week)
    Resource.create(multiple: multiple, name: name, week_id: week)
  end
end