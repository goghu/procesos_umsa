class AddPersonaIdToDenuncias < ActiveRecord::Migration[5.1]
  def change
    add_column :denuncia, :persona_id, :integer, :after => :nombre
  end
end
