class CreateFacultades < ActiveRecord::Migration[5.1]
  def change
    create_table :facultades do |t|
      t.string :nombre
      t.string :observaciones
      t.string :estado
      t.datetime :borrado

      t.timestamps
    end
  end
end
