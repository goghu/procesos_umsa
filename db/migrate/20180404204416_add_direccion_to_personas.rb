class AddDireccionToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :direccion, :string, :after => :carrera
  end
end
