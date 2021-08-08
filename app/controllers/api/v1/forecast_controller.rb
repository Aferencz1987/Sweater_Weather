class Api::V1::ForecastController < ApplicationController
  def index
    location_coordinates = MapFacade.coordinates(params[:location])
    forecast = ForecastFacade.forecast(location_coordinates)
    render json: ForecastSerializer.new(forecast)
  end
end
