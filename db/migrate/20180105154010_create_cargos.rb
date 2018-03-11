class CreateCargos < ActiveRecord::Migration[5.1]
  def change
    create_table :cargos do |t|
      t.string :nombre
      t.string :tipo
      t.datetime :borrado

      t.timestamps
    end
  end
end
