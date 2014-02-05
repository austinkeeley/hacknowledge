class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.integer :user_id
      t.string :provider
      t.string :url

      t.timestamps
    end
  end
end
