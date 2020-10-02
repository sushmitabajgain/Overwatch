class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project, :project_health, :project_timeline, :workload,
          :week_id, :pending_raid, :milestone_status, :notes
end
