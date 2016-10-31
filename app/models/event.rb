class Event < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  belongs_to :admin

end