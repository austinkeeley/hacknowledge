# user.rb
# A user is someone who can login to the application and do things.
# A user is linked to many partcipations in hackathons through the
# participants.
class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  has_many :participants
  has_many :events, :through => :participants
end
