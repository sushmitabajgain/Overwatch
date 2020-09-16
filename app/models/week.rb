class Week < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :resources, dependent: :destroy
end
