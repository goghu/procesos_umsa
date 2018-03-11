class AddApellidoToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :ap_paterno, :string, :limit => 20
    add_column :personas, :ap_materno, :string, :limit => 30
  end
end
