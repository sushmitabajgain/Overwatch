class Milestone < ApplicationRecord
  belongs_to :week,  class_name: "Week"
end