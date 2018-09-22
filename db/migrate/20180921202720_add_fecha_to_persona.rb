class AddFechaToPersona < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :fecha, :string, :after => :no_inf
  end
end
