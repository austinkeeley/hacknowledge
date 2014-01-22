# event.rb
# Represents a hackathon-style event
class Event < ActiveRecord::Base
  validates_presence_of :name, :start, :end

  # Normally every participant should be on a team, 
  # but teams aren't formed initially.
  has_many :teams
  has_many :participants
end
