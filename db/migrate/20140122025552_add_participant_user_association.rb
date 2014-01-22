class AddParticipantUserAssociation < ActiveRecord::Migration
  def change
    add_column :participants, :user_id, :integer
    add_column :participants, :event_id, :integer
  end
end
