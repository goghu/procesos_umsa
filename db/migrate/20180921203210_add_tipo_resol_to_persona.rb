class AddTipoResolToPersona < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :tipo_resol, :string, :after => :codigo_caso
  end
end
