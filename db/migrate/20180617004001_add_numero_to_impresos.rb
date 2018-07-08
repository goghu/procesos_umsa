class AddNumeroToImpresos < ActiveRecord::Migration[5.1]
  def change
    add_column :impresos, :numero, :string, :after => :no_reg
  end
end
