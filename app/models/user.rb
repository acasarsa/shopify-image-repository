class User < ApplicationRecord
  has_many :posts
  validates :name, :password, presence: true
  has_secure_password
  
end
