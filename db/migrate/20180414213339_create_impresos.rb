class CreateImpresos < ActiveRecord::Migration[5.1]
  def change
    create_table :impresos do |t|
      t.integer :personas_id
      t.integer :denuncium_id
      t.integer :user_id

      t.timestamps
    end
  end
end
