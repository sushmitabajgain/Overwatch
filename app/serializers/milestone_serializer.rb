class MilestoneSerializer < ActiveModel::Serializer
  attributes :id, :project, :no_of_milestones, :completed_milestones, :missed_milestones, :week_id
end
