class Sponsor < ActiveRecord::Base
  belongs_to :event
  has_many :swags
end
