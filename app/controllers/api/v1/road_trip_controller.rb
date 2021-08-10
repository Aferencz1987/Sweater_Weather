class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user != nil
    destination_coordinates = MapFacade.coordinates(params[:destination])
    trip = RoadTripFacade.trip_details(params[:origin], params[:destination])

    render json: RoadTripSerializer.new(trip)
  else
    render json: { error: 'Incorrect API key input'}
    end
  end
end
