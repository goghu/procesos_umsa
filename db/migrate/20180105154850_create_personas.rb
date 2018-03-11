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
      t.datetime :borrado

      t.timestamps
    end
  end
end
