class AddCorreltCertfToImpresos < ActiveRecord::Migration[5.1]
  def change
    add_column :impresos, :correlt_certf, :string, :after => :fecha_emi_certf
  end
end
