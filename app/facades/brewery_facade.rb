class BreweryFacade
  def self.breweries(coordinates)
    brewery_result = BreweryService.breweries(coordinates)
    brewery_array = brewery_result.map do |brewery|
      {
        id: brewery[:id],
        name: brewery[:name],
        brewery_type: brewery[:brewery_type]
      }
    end
    BreweryPoro.new(breweries: brewery_array)
  end
end
