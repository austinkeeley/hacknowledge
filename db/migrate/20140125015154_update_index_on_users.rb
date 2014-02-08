class UpdateIndexOnUsers < ActiveRecord::Migration
  def change
	remove_index(:users, :name => 'index_users_on_email')
    #sql = 'DROP INDEX index_users_on_email'
    #sql << ' ON users' if Rails.env == 'production' # Heroku pg
    #ActiveRecord::Base.connection.execute(sql)
  end
end
