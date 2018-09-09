class AddCamposToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_hash, :string, after: :nombre, :limit => 240
    add_column :users, :password_salt, :string, after: :nombre, :limit => 240
  end
end
