class AddFechaToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :fecha, :date
  end
end
