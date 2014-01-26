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

  # Creates a new authentication and adds it to this user
  def add_authentication(provider, uid)
    # Only allow one authentication provider per use, e.g. don't let people
    # have multiple Twitter accounts linked.  That could get confusing and in
    # general, people only have one of each anyway.
    authentications.each do |auth|
      if auth.provider == provider
        return auth
      end
    end
    auth = Authentication.new(:provider => provider, :uid => uid)
    auth.user = self
    auth.save
    return auth
  end

  # Gets a readable name for this user.  This doesn't uniquely identify them
  # and should only be used for display purposes only.
  def display_name
    name = ''

    # Use the first and last name if they are available
    if first_name
      name += first_name
    end
    if last_name
      name += ' ' + last_name
    end

    # if no name then try the email address
    if name == ''
      name = email
    end

    # if no email, then fall back on some dumb thing.
    if name == ''
      name = 'A registered, but unnamed user.'
    end

    return name
  end


  # Using an auth object captured from an omniauth callback, find the user in 
  # the database (or create a new user and add this as an authentication method).
  def self.from_omniauth(auth)
    uid = auth.uid
    provider = auth.provider

    authentication = Authentication.find_or_create_by(:provider => provider, :uid => uid)
    
    # if we're currently logged in, then add the authentication to the current user
    #if user_signed_in?
    #  authentication.user = current_user
    #  return current_user
    #else
    if !authentication.user
      user = User.new
      authentication.user = user
      user.save
      authentication.save
    end
    return authentication.user
  end

end
