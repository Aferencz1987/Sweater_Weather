class RoadTripFacade
  def self.trip_details(start, finish)
    map_response = MapService.trip_details(start,finish)
    if map_response[:info][:statuscode] != 0
      return false
    end
    ending_location = MapFacade.coordinates(finish)
    math_time = map_response[:route][:realTime].to_f/3600
    time = map_response[:route][:formattedTime]
    forecast_result = ForecastService.forecast(ending_location)
    hourly_array = forecast_result[:hourly].map do |hour|
      {
        temperature: hour[:temp],
        condition: hour[:weather].first[:description]
      }
    end
    RoadTripPoro.new(weather_at_eta: hourly_array[math_time+1], travel_time: time, start_city: start, end_city: finish)
  end

end
