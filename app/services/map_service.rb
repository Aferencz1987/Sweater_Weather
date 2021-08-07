class MapService
  
  def self.coordinates_finder(location)
    response = conn.get "/geocoding/v1/address?key=#{ENV['MAP_KEY']}&location=#{location}"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn   #(auth_token = nil)
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      # faraday.headers[:Authorization] = "Bearer #{auth_token}"
    end
  end
end
