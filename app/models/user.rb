class User < ApplicationRecord
  belongs_to :role,  class_name: "Role"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  mount_uploader :image, ImageUploader
  serialize :image, JSON 

  validates_presence_of :email, uniqueness: true
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
end
