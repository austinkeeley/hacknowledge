class CreateSwags < ActiveRecord::Migration
  def change
    create_table :swags do |t|
      t.string :name
      t.text :description
      t.integer :sponsor_id
      t.integer :event_id
      t.timestamps
    end
  end
end
