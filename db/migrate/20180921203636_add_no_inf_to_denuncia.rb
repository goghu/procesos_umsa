class AddNoInfToDenuncia < ActiveRecord::Migration[5.1]
  def change
    add_column :denuncia, :no_inf, :string, :after => :rev_inic
  end
end
