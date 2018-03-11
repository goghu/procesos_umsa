class Elegido < ApplicationRecord
  belongs_to :persona, :optional => true
  belongs_to :cargo, :optional => true
  belongs_to :listum, :optional => true
end
