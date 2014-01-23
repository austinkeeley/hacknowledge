# user.rb
# A user is someone who can login to the application and do things.
# A user is linked to many partcipations in hackathons through the
# participants.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable #, :validatable
  validates_presence_of :first_name, :last_name

  has_many :participants
  has_many :events, :through => :participants

  # We want to provide many ways for a user to login through
  # omniauth (Twiter, Facebook, etc.)
  has_many :authentications
end
