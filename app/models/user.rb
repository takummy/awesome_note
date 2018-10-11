class User < ApplicationRecord
  before_validation {email.downcase!}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true, length:{maximum: 50}
  validates :email, presence: true, length:{maximum: 255}, format: {with: VALID_EMAIL_REGEX}
  validates :password_digest, presence: true, length:{minimum: 6}
  has_secure_password
end