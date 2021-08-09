class Api::V1::BreweryController < ApplicationController
  def index
    location_coordinates = MapFacade.coordinates(params[:location])
    breweries_and_forecast = ForecastBreweryFacade.breweries_and_forecast(location_coordinates)
    render json: ForecastBrewerySerializer.new(breweries_and_forecast)
  end
end
