require 'rails_helper'

RSpec.describe 'open forecast api' do
  it 'returns forecast for location' do
    VCR.use_cassette 'denver forecast' do
      map = MapPoro.new(location: 'Denver,CO', latitude: 39.738453,longitude: -104.984853)
      result = ForecastService.forecast(map)

      expect(result).to have_key(:lon)
      expect(result).to have_key(:lat)
      expect(result).to_not have_key(:minutely)
      expect(result[:current]).to have_key(:temp)
      expect(result[:hourly].first).to have_key(:temp)
      expect(result[:daily].first).to have_key(:temp)
      expect(result[:current][:temp]).to eq(90.81)
    end
  end
end
