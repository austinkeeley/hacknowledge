class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
    remove_column :participants, :first_name
    remove_column :participants, :last_name
  end
end
