class AddYearToImpresos < ActiveRecord::Migration[5.1]
  def change
    add_column :impresos, :year, :string, :after => :correlt_certf
  end
end
