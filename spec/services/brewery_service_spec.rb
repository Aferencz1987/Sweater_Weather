require 'rails_helper'

RSpec.describe 'open brewery api' do
  it 'returns a brewery for a destination' do
    VCR.use_cassette 'denver brewery' do
      map = MapPoro.new(location: 'Denver,CO', latitude: 39.738453,longitude: -104.984853)
      result = BreweryService.breweries(map)
      expect(result.first).to have_key(:name)
    end
  end
end
