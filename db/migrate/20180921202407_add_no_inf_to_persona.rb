class AddNoInfToPersona < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :no_inf, :string, :after => :observacion
  end
end
