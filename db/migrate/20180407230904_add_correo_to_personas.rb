class AddCorreoToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :correo, :string
  end
end
