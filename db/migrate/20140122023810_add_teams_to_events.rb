class AddTeamsToEvents < ActiveRecord::Migration
  def change
    add_column :teams, :event_id, :string
  end
end
