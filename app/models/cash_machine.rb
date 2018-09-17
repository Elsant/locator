class CashMachine < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  reverse_geocoded_by :latitude, :longitude

  validates_presence_of :name, :latitude, :longitude
  validates_numericality_of :latitude, :longitude
  validates_inclusion_of :latitude, in: (-90.0 .. 90.0)
  validates_inclusion_of :longitude, in: (-180.0 .. 180.0)

  scope :nearest, ->(qty, point) do
    # select(":id, #{table_name}.name #{table_name}.latitude #{table_name}.longitude")
    select(:id, :name, :latitude, :longitude)
      .select("(#{distance_from_sql(point)}) as distance")
      .order('distance')
      .limit(qty)
  end
end
