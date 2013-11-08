class User < ActiveRecord::Base
  rolify

  validates :email, presence: true, uniqueness: true, email: true
  validates_presence_of :password_digest
  validates_confirmation_of :password

  has_secure_password(validations: false)
end
