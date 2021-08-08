require 'rails_helper'

RSpec.describe 'forecast facade' do
  it 'returns forecast' do
    VCR.use_cassette 'denver forecast' do
      map = MapPoro.new(location: 'Denver,CO', latitude: 39.738453,longitude: -104.984853)
      result = ForecastFacade.forecast(map)

      expect(result.current_datetime.to_s).to eq("2021-08-08 16:46:33 -0600")
      expect(result.current_condition).to eq("clear sky")
      expect(result.current_feels_like).to eq(87.01)
      expect(result.hourly_forecast.count).to eq(8)
      expect(result.daily_forecast.count).to eq(5)
    end
  end
end
