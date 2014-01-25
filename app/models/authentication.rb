# authentication.rb
# This represents a way for a user to be authenticated.  A User
# can have many of these representing multiple authentication methods.
class Authentication < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :provider
  validates_presence_of :uid

  validates_presence_of :user
  
end
