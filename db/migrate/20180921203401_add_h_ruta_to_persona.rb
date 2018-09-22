class AddHRutaToPersona < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :h_ruta, :string, :after => :tipo_resol
  end
end
