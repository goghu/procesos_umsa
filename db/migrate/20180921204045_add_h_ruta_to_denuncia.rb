class AddHRutaToDenuncia < ActiveRecord::Migration[5.1]
  def change
    add_column :denuncia, :h_ruta, :string, :after => :no_inf
  end
end
