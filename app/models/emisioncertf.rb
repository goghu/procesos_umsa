class Emision < ApplicationRecord
	belongs_to :persona, :optional => true
end
