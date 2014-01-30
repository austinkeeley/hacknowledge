# participant.rb
# A participant represents a user's participation in a hackathon.
# This allows us to do a many-to-many relationship between
# users and events.
class Participant < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  # A Partcipant belongs on a team
  belongs_to :team

  # A role is just at title to identify you at the event,
  # such as "developer" or "marketing guru".
  validates_presence_of :role
end
