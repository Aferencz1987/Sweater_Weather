class WeatherPoro
  attr_reader :current_datetime,
              :current_sunrise,
              :current_sunset,
              :current_temp,
              :current_feels_like,
              :current_humidity,
              :current_uvi,
              :current_visibility,
              :current_description,
              :current_icon

  def initialize(attributes)
    @current_datetime = attributes[:current_datetime]
    @current_sunrise = attributes[:current_sunrise]
    @current_sunset = attributes[:current_sunset]
    @current_temp = attributes[:current_temp]
    @current_feels_like = attributes[:current_feels_like]
    @current_humidity = attributes[:current_humidity]
    @current_uvi = attributes[:current_uvi]
    @current_visibility = attributes[:current_visibility]
    @current_description = attributes[:current_description]
    @current_icon = attributes[:current_icon]
  end
end
