class Week < ApplicationRecord
  has_many :projects, dependent: :destroy
end
