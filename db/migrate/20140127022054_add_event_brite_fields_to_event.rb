class AddEventBriteFieldsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :organizer_name, :string
    add_column :events, :organizer_description, :text
    add_column :events, :venue_name, :string
    add_column :events, :address_1, :string
    add_column :events, :address_2, :string
    add_column :events, :city, :string
    add_column :events, :postal_code, :string
    add_column :events, :country, :string
    add_column :events, :latitude, :decimal
    add_column :events, :longitude, :decimal
  end
end
