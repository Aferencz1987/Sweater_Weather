class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user != nil
      destination_coordinates = MapFacade.coordinates(params[:destination])
      trip = RoadTripFacade.trip_details(params[:origin], params[:destination])
      if trip == false
        render json: {
          "data": {
            "id": nil,
            "type": "roadtrip",
            "attributes": {
              "start_city": params[:origin],
              "end_city": params[:destination],
              "travel_time": "Impossible",
              "weather_at_eta": {}
            }
          }
        }, status: 400
      else
        render json: RoadTripSerializer.new(trip)
      end
    else
      render json: { error: 'Incorrect API key input'}, status: 401
    end
  end
end
