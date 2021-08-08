class ForecastPoro
  attr_reader :current_datetime,
              :current_sunrise,
              :current_sunset,
              :current_temp,
              :current_feels_like,
              :current_humidity,
              :current_uvi,
              :current_visibility,
              :current_condition,
              :current_icon,
              :daily_forecast,
              :hourly_forecast

  def initialize(attributes)
    @current_datetime = attributes[:current_datetime]
    @current_sunrise = attributes[:current_sunrise]
    @current_sunset = attributes[:current_sunset]
    @current_temp = attributes[:current_temp]
    @current_feels_like = attributes[:current_feels_like]
    @current_humidity = attributes[:current_humidity]
    @current_uvi = attributes[:current_uvi]
    @current_visibility = attributes[:current_visibility]
    @current_condition = attributes[:current_condition]
    @current_icon = attributes[:current_icon]
    @daily_forecast = attributes[:daily_forecast]
    @hourly_forecast = attributes[:hourly_forecast]
  end
end
