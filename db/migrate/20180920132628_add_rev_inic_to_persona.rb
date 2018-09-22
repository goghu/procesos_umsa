class AddRevInicToPersona < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :rev_inic, :string, :after => :fallo
  end
end
