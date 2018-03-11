class CreateCarreras < ActiveRecord::Migration[5.1]
  def change
    create_table :carreras do |t|
      t.integer :facultade_id
      t.string :nombre, :limit => 50
      t.string :descripcion

      t.timestamps
    end
  end
end
