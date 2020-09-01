class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  #validation for users
  validates :username, presence: true, :uniqueness => { :message => "Username already present."}
  # validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :email, presence: true, :uniqueness=> {
    :message => "Email address already exist"
  }
  PASSWORD_FORMAT = /\A
      (?=.{8,})          # Must contain 8 or more characters
      (?=.*\d)           # Must contain a digit
      (?=.*[a-z])        # Must contain a lower case character
      (?=.*[A-Z])        # Must contain an upper case character
      (?=.*[[:^alnum:]]) # Must contain a symbol
    /x
end
