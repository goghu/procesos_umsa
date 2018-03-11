class CreateDenuncia < ActiveRecord::Migration[5.1]
  def change
    create_table :denuncia do |t|
      t.string :tipo_pe_persona, :limit => 20
      t.string :nombre, :limit => 50
      t.string :ci, :limit => 20
      t.string :ru_item, :limit => 30
      t.date :fecha
      t.integer :facultad_id
      t.integer :carrera_id
      t.string :tipo_resol, :limit => 20
      t.string :codigo_caso, :limit => 30
      t.string :direccion
      t.string :telefono, :limit => 30
      t.string :observaciones
      t.string :fallo, :limit => 10

      t.timestamps
    end
  end
end
