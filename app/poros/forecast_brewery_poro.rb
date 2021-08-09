class ForecastBreweryPoro
  attr_reader :breweries,
              :destination,
              :id,
              :forecast

  def initialize(attributes)
    @id = ''
    @destination = attributes[:destination]
    @breweries = attributes[:breweries].take(attributes[:quantity])
    @forecast = attributes[:forecast]
  end
end
