class Impreso < ApplicationRecord
	belongs_to :persona, :optional => true
end
