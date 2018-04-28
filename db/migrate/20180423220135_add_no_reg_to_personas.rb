class AddNoRegToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :no_reg, :string, :after => :correlt_certf
  end
end
