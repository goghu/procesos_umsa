class AddApellidoMaternoToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :ap_materno, :string, :after => :ap_paterno
  end
end
