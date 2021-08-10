require 'rails_helper'

RSpec.describe 'brewery facade' do
  xit 'returns breweries' do
    VCR.use_cassette 'denver brewery' do
      map = MapPoro.new(location: 'Denver,CO', latitude: 39.738453,longitude: -104.984853)
      result = BreweryFacade.breweries(map)

      expect(result.breweries.first[:name]).to eq("Black Beak Brewing")
    end
  end
end
