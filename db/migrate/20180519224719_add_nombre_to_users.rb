class AddNombreToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nombre, :string, :after => :username
  end
end
