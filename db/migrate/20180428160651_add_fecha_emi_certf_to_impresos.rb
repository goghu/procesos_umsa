class AddFechaEmiCertfToImpresos < ActiveRecord::Migration[5.1]
  def change
    add_column :impresos, :fecha_emi_certf, :date, :after=> :denuncium_id
  end
end
