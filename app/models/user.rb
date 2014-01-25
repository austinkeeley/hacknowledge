# user.rb
# A user is someone who can login to the application and do things.
# A user is linked to many partcipations in hackathons through the
# participants.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable #, :validatable
  #validates_presence_of :first_name, :last_name

  has_many :participants
  has_many :events, :through => :participants

  # We want to provide many ways for a user to login through
  # omniauth (Twiter, Facebook, etc.)
  has_many :authentications

  # People might be using other authentication methods, so we'll remove 
  # the need for email
  def email_required?
    false
  end
  def email_changed?
    false
  end


  # Using an auth object captured from an omniauth callback, find the user in 
  # the database (or create a new user and add this as an authentication method).
  def self.from_omniauth(auth)
    uid = auth.uid
    provider = auth.provider

    authentication = Authentication.find_or_create_by(:provider => provider, :uid => uid)
    if !authentication.user
      user = User.new
      authentication.user = user
      user.save
      authentication.save
    end
    return authentication.user
  end

end
