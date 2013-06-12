require 'bcrypt'

class User < ActiveRecord::Base
  has_many :comments
  has_many :posts

  validates :username, uniqueness: true
  validates :username, presence: true

  include BCrypt
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
