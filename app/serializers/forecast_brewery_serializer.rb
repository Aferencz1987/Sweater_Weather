class ForecastBrewerySerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  set_type :breweries
  attributes :destination, :forecast, :breweries
end
