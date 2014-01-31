# team.rb
# Represents a team in a hackathon. A team belongs to a particular event,
# so while users can participate in multiple hackathons, a new team will
# need to be created for each.
class Team < ActiveRecord::Base
  belongs_to :event
  has_many :participants

  validates presence_of :name
  validates presence_of :description

  has_many :stack_components
  
end
