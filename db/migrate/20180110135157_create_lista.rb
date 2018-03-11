class CreateLista < ActiveRecord::Migration[5.1]
  def change
    create_table :lista do |t|
      t.string :nombre
      t.string :descripcion
      t.datetime :borrado

      t.timestamps
    end
  end
end
