class CreatePersonas < ActiveRecord::Migration[5.1]
  def change
    create_table :personas do |t|
      t.string :item
      t.string :ci
      t.string :nombre
      t.string :facultad
      t.string :carrera
      t.string :tipo
      t.string :categoria
      t.string :ap_paterno
      t.string :ap_materno
      t.string :tipo
      t.datetime :borrado

      t.timestamps
    end
  end
end
