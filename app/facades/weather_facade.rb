class WeatherFacade
  def self.weather(lat, lon)
    weather_result = WeatherService.weather(lat, lon)
      WeatherPoro.new(current_temp: weather_result[:main][:temp],
                      current_feels_like: weather_result[:main][:feels_like],
                      current_low: weather_result[:main][:temp_min],
                      current_high: weather_result[:main][:temp_max])
  end
end
