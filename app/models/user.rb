class User < ApplicationRecord
  # has_many :albums
  # add validation that user must have username and password
  validates :username, presence: true
  validates :password, presence: true
  
end