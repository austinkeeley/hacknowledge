class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :name
      t.text :description
      t.integer :sponsor_id
      t.integer :event_id

      t.timestamps
    end
  end
end
