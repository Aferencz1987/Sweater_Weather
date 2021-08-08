class WeatherFacade
  def self.weather(lat, lon)
    weather_result = WeatherService.weather(lat, lon)
      WeatherPoro.new(current_datetime: weather_result[:current][:dt],
                      current_sunrise: weather_result[:current][:sunrise],
                      current_sunset: weather_result[:current][:sunset],
                      current_temp: weather_result[:current][:temp],
                      current_feels_like: weather_result[:current][:feels_like],
                      current_humidity: weather_result[:current][:humidity],
                      current_uvi: weather_result[:current][:uvi],
                      current_visibility: weather_result[:current][:visibility],
                      current_description: weather_result[:current][:weather].first[:description],
                      current_icon: weather_result[:current][:weather].first[:icon],
                      daily_weather: weather_result[:daily],
                      hourly_weather: weather_result[:hourly])

  end
end


# icon, string, as given by OpenWeather
# daily_weather, array of the next 5 days of daily weather data:
# date, in a human-readable format such as “2020-09-30”
# sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
# sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
# max_temp, floating point number indicating the maximum expected temperature in Fahrenheit
# min_temp, floating point number indicating the minimum expected temperature in Fahrenheit
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather
# hourly_weather, array of the next 8 hours of hourly weather data:
# time, in a human-readable format such as “14:00:00”
# temperature, floating point number indicating the current temperature in Fahrenheit
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather
