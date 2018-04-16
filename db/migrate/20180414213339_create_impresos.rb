class CreateImpresos < ActiveRecord::Migration[5.1]
  def change
    create_table :impresos do |t|
      t.integer :personas_id
      t.interger :denuncium_id
      t.interger :user_id

      t.timestamps
    end
  end
end
