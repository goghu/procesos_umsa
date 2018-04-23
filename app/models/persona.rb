class Persona < ApplicationRecord
	belongs_to :persona, :optional => true
end
