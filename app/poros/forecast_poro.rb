class ForecastPoro
  attr_reader :id,
              :current_forecast,
              :daily_forecast,
              :hourly_forecast

  def initialize(attributes)
    @id = ''
    @current_forecast = attributes[:current_forecast]
    @daily_forecast = attributes[:daily_forecast]
    @hourly_forecast = attributes[:hourly_forecast]
  end
end
