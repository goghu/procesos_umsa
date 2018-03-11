class CreateExcels < ActiveRecord::Migration[5.1]
  def change
    create_table :excels do |t|
      t.string :nombre
      t.string :archivo

      t.timestamps
    end
  end
end
