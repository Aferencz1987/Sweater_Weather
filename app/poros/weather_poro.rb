class WeatherPoro
   attr_reader :current_temp,
              :current_feels_like,
              :current_low,
              :current_high
def initialize(attributes)
  @current_temp = attributes[:current_temp]
  @current_feels_like = attributes[:current_feels_like]
  @current_low = attributes[:current_low]
  @current_high = attributes[:current_high]
  end
end
