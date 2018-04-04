class AddTelefonoToPersonas < ActiveRecord::Migration[5.1]
	def change
		add_column :personas, :telefono, :string, :after => :direccion
	end
end
