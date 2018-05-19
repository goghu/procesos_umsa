class AddTipoUserToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tipo_user, :string, :after => :email
  end
end
