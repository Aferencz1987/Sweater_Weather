class MapPoro
  attr_reader :location,
              :latitude,
              :longitude
  def initialize(attributes)
    @location = attributes[:location]
    @latitude = attributes[:latitude]
    @longitude = attributes[:longitude]
  end
end
