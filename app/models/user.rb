class User < ActiveRecord::Base
  
  has_secure_password
  has_many :comments
  has_many :user_events
  has_many :events, through: :user_events
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password
  

end