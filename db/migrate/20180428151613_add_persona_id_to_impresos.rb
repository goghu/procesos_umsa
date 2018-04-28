class AddPersonaIdToImpresos < ActiveRecord::Migration[5.1]
  def change
    add_column :impresos, :persona_id, :integer, :after => :id
  end
end
