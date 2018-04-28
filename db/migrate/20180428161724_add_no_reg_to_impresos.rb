class AddNoRegToImpresos < ActiveRecord::Migration[5.1]
  def change
    add_column :impresos, :no_reg, :string, :after => :correlt_certf
  end

end
