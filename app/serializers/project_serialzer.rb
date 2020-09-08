class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :sn, :status, :project, :start_date, :end_date, :extended_date,
             :notes, :week, :no_of_resources, :no_of_milestone,
             :completed_milestone, :missed_milestone
end