class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :null
  set_type :forecast
  attributes :current_forecast, :daily_forecast, :hourly_forecast
end
