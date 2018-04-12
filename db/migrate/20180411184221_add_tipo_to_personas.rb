class AddTipoToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :tipo, :string, :after => :carrera
  end
end
