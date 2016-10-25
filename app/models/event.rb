class Event < ActiveRecord::Base

  has_many :comments
  has many :user_events
  has_many :users, through: :user_events

end