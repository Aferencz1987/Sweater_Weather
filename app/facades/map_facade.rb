class MapFacade
  def self.coordinates(location)
    stripped_location = location.delete(' ')
    coordinates_result = MapService.coordinates_finder(stripped_location)
    map_info = coordinates_result[:results].first

  MapPoro.new(location: map_info[:providedLocation][:location],
              latitude: map_info[:locations].first[:latLng][:lat],
              longitude: map_info[:locations].first[:latLng][:lng])
  end
end
