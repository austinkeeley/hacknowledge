class Avatar < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :url
  validates_presence_of :provider
end
