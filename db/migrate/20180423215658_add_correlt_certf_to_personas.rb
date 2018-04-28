class AddCorreltCertfToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :correlt_certf, :string, :after => :observacion
  end
end
