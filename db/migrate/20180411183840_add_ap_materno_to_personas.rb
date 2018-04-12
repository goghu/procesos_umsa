class AddApMaternoToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :ap_Materno, :string, :after => :ap_paterno
     end
end
