class AddCodigoCasoToPersona < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :codigo_caso, :string, :after => :fecha
  end
end
