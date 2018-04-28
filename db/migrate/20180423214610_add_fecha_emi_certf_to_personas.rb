class AddFechaEmiCertfToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :fecha_emi_certf, :date, :after => :observacion
  end
end
