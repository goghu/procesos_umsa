class AddFalloToPersonas < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :fallo, :string, :after => :categoria
  end
end
