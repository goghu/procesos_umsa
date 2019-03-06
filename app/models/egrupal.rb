class Egrupal < ApplicationRecord
	belongs_to :persona, :optional => true
	belongs_to :impreso, :optional => true
end
