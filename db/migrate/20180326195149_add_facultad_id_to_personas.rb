class AddFacultadIdToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :facultad_id, :integer, :after => :id
  end
end
