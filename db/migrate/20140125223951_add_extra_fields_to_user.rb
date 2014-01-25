class AddExtraFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :title, :string
  end
end
