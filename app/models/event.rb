# event.rb
# Represents a hackathon-style event
class Event < ActiveRecord::Base
  validates_presence_of :name, :start, :end

  # Normally every participant should be on a team, 
  # but teams aren't formed initially.
  has_many :teams
  has_many :participants

  # Every event needs an admin who is ultimately
  # in control of things, although they can
  # delegate power to other users as well.
  belongs_to :admin, :class_name => 'User'
  validates_presence_of :admin
end
