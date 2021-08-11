class ForecastFacade
  def self.forecast(coordinates)
    forecast_result = ForecastService.forecast(coordinates)
    current_weather = {
      current_datetime: Time.at(forecast_result[:current][:dt]),
      current_sunrise: Time.at(forecast_result[:current][:sunrise]),
      current_sunset: Time.at(forecast_result[:current][:sunset]),
      current_temp: forecast_result[:current][:temp],
      current_feels_like: forecast_result[:current][:feels_like],
      current_humidity: forecast_result[:current][:humidity],
      current_uvi: forecast_result[:current][:uvi],
      current_visibility: forecast_result[:current][:visibility],
      current_condition: forecast_result[:current][:weather].first[:description],
      current_icon: forecast_result[:current][:weather].first[:icon]
    }
    daily_array = forecast_result[:daily][0..4].map do |day|
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
    hourly_array = forecast_result[:hourly][0..7].map do |hour|
      {
        time: Time.at(hour[:dt]),
        temp: hour[:temp],
        condition: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
    ForecastPoro.new(current_forecast: current_weather,
                    daily_forecast: daily_array,
                    hourly_forecast: hourly_array)
  end

end
