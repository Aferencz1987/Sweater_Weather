class MapService

  def self.coordinates_finder(location)
    response = conn.get "/geocoding/v1/address?key=#{ENV['MAP_KEY']}&location=#{location}"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.trip_details(start, finish)
    response = conn.get "/directions/v2/route?key=#{ENV['MAP_KEY']}&from=#{start},CO&to=#{finish}"
    search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
    end
  end
end
