class BreweryPoro
  attr_reader :breweries

  def initialize(attributes)
    @breweries = attributes[:breweries]
  end
end
