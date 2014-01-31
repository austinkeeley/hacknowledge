# stack_component.rb
# A stack component is a way for teams to show off what they are using
# and for organizers to get a general idea of what's popular. 
class StackComponent < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :team
end
