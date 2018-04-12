class AddApPaternoToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :Ap_paterno, :string, :after => :nombre
  end
end
