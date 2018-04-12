class Denuncium < ApplicationRecord
	belongs_to :persona, :optional => true
end
