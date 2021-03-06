class Api::V1::BackgroundController < ApplicationController
  def index
    location_coordinates = MapFacade.coordinates(params[:location])
    image = BackgroundFacade.image(location_coordinates)
    render json: BackgroundSerializer.new(image)
  end
end
