class CreateStackComponents < ActiveRecord::Migration
  def change
    create_table :stack_components do |t|
      t.string :name, :null => false
      t.integer :team_id, :null => false
      t.timestamps
    end
    add_index(:stack_components, [:name, :team_id], {:unique => true})
  end
end
