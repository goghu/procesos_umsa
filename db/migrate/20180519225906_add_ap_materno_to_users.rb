class AddApMaternoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ap_materno, :string, :after => :ap_paterno
  end
end
