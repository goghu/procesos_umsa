class ChangeTypeElegido < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :elegidos, :lista, :lista_id
  end

  def self.down


  end

end



