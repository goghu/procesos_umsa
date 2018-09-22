class AddRevInicToDenuncia < ActiveRecord::Migration[5.1]
  def change
    add_column :denuncia, :rev_inic, :string, :after => :fallo
  end
end
