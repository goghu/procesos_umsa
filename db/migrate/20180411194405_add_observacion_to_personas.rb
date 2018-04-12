class AddObservacionToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :observacion, :string, :after => :fallo
  end
end
