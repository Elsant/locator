class CashMachine < ApplicationRecord
  validates_presence_of :name, :latitude, :longitude
  validates_inclusion_of :latitude, in: (-90.0 .. 90.0)
  validates_inclusion_of :longitude, in: (-180.0 .. 180.0)
end
