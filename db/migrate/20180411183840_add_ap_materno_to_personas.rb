class AddApMaternoToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :Ap_Materno, :string, :after => :Ap_Paterno
     end
end
