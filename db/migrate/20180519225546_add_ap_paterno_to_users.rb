class AddApPaternoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ap_paterno, :string, :after => :nombre
  end
end
