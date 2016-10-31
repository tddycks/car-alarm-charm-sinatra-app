class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :admin
end