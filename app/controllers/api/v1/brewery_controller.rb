class Api::V1::BreweryController < ApplicationController
  def index
    location_coordinates = MapFacade.coordinates(params[:location])
    if params[:quantity].to_i > 0
      breweries_and_forecast = ForecastBreweryFacade.breweries_and_forecast(location_coordinates, params[:quantity])
      render json: ForecastBrewerySerializer.new(breweries_and_forecast)
    else
      render json: { error: 'Please choose a number greater than 0' }
    end
  end
end
