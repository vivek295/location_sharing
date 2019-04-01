class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    if table_exists? :users
      add_column :users, :username, :string
      add_index :users, :username, unique: true
    end
  end
end
