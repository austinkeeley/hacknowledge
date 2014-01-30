class CreateSocialNetworkLinks < ActiveRecord::Migration
  def change
    create_table :social_network_links do |t|
      t.integer :user_id, :null => false
      t.string :network, :null => false
      t.string :url, :null => false
      t.timestamps
    end

    add_index(:social_network_links, [:user_id, :network], {:unique => true})
  end
end
