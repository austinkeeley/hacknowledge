class SocialNetworkLink < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :network
  validates_presence_of :url
end
