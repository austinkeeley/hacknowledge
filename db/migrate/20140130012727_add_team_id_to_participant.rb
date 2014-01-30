class AddTeamIdToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :team_id, :integer
  end
end
