class WeatherService

  def self.weather(lat, lon)
    response = conn.get "/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{ENV['WEATHER_KEY']}"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn   #(auth_token = nil)
    Faraday.new(url: 'api.openweathermap.org') do |faraday|
      # faraday.headers[:Authorization] = "Bearer #{auth_token}"
    end
  end
end
