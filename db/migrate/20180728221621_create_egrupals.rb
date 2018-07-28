class CreateEgrupals < ActiveRecord::Migration[5.1]
  def change
    create_table :egrupals do |t|
      t.integer :persona_id
      t.integer :impreso_id

      t.timestamps
    end
  end
end
