class Point
  include ActiveModel::Validations
  attr_accessor :lat, :long

  validates :lat, presence: true, numericality: true, inclusion: { in: -90.0 .. 90.0, message: "Must be in -90.0 .. 90.0 range" }
  validates :long, presence: true, numericality: true, inclusion: { in: -180.0 .. 180.0, message: "Must be in -180.0 .. 180.0 range" }

  def initialize(params={})
    @lat  = params[:lat].to_f
    @long = params[:long].to_f
    ActionController::Parameters.new(params.permit(:lat,:long, :format).to_h)
  end
end
