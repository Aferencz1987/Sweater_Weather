class ForecastBreweryFacade
  def self.breweries_and_forecast(coordinates)
    brewery_result = BreweryService.breweries(coordinates)
    forecast_result = ForecastService.forecast(coordinates)
    location = coordinates.location

    brewery_array = brewery_result.map do |brewery|
      {
        id: brewery[:id],
        name: brewery[:name],
        brewery_type: brewery[:brewery_type]
      }
    end
    current_weather =
      {
      temperature: "#{forecast_result[:current][:temp].to_i} F",
      summary: forecast_result[:current][:weather].first[:description],
      }
    ForecastBreweryPoro.new(forecast: current_weather,
                    breweries: brewery_array, destination: location)
  end
end
