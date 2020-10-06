class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :project, :no_of_resources, :week_id
end
