class CreateElegidos < ActiveRecord::Migration[5.1]
  def change
    create_table :elegidos do |t|
      t.integer :persona_id
      t.integer :cargo_id
      t.date :fecha
      t.integer :lista
      t.datetime :borrado

      t.timestamps
    end
  end
end
