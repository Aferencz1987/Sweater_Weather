require 'rails_helper'

RSpec.describe 'forecast brewery facade' do
  it 'returns breweries' do
    VCR.use_cassette 'denver brewery with forecast' do
      map = MapPoro.new(location: 'Denver,CO', latitude: 39.738453,longitude: -104.984853)
      result = ForecastBreweryFacade.breweries_and_forecast(map)

      expect(result.breweries.first[:city]).to eq('Denver')
    end
  end
end
