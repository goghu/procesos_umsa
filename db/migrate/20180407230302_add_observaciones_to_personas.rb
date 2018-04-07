class AddObservacionesToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :observaciones, :string
  end
end
