class Admin < ActiveRecord::Base
  has_secure_password
  has_many :users
  has_many :comments
  has_many :events
end