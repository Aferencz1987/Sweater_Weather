class BreweryService
  def self.breweries(map_poro)
    lat = map_poro.latitude
    lon = map_poro.longitude
    response = conn.get "/breweries?by_dist=#{lat},#{lon}"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openbrewerydb.org') do |faraday|
    end
  end
end
