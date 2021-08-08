require 'rails_helper'

RSpec.describe 'forecast facade' do
  it 'returns forecast' do
    VCR.use_cassette 'denver forecast' do
      map = MapPoro.new(location: 'Denver,CO', latitude: 39.738453,longitude: -104.984853)
      result = ForecastFacade.forecast(map)

      expect(result.current_forecast.count).to eq(10)
      expect(result.hourly_forecast.count).to eq(8)
      expect(result.daily_forecast.count).to eq(5)
    end
  end
end
