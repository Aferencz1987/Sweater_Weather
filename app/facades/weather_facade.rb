class WeatherFacade
  def self.weather(lat, lon)
    weather_result = WeatherService.weather(lat, lon)
    daily_array = weather_result[:daily][0..4].map do |day|
      {
        date: Time.at(day[:dt]),
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
    hourly_array = weather_result[:hourly][0..7].map do |hour|
      {
        time: Time.at(hour[:dt]),
        temp: hour[:temp],
        condition: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
    WeatherPoro.new(current_datetime: Time.at(weather_result[:current][:dt]),
                    current_sunrise: Time.at(weather_result[:current][:sunrise]),
                    current_sunset: Time.at(weather_result[:current][:sunset]),
                    current_temp: weather_result[:current][:temp],
                    current_feels_like: weather_result[:current][:feels_like],
                    current_humidity: weather_result[:current][:humidity],
                    current_uvi: weather_result[:current][:uvi],
                    current_visibility: weather_result[:current][:visibility],
                    current_condition: weather_result[:current][:weather].first[:description],
                    current_icon: weather_result[:current][:weather].first[:icon],
                    daily_weather: daily_array,
                    hourly_weather: hourly_array)
  end
end
