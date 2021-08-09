class ForecastService

  def self.forecast(map_poro)
    lat = map_poro.latitude
    lon = map_poro.longitude
    response = conn.get "/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&appid=#{ENV['WEATHER_KEY']}&units=imperial"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn   #(auth_token = nil)
    Faraday.new(url: 'http://api.openweathermap.org') do |faraday|
      # faraday.headers[:Authorization] = "Bearer #{auth_token}"
    end
  end
end
