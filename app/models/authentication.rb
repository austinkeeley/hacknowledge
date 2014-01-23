# authentication.rb
# A way for a user to login
class Authentication < ActiveRecord::Base
  belongs_to :user
end
