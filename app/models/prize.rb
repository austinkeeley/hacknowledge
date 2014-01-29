class Prize < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :event
end
