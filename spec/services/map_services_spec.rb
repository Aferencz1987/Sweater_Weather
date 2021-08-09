require 'rails_helper'

RSpec.describe 'mapquest api' do
  it 'returns a latitude and longitude for given location' do
    VCR.use_cassette 'denver map' do
      result = MapService.coordinates_finder('Denver,CO')

      expect(result[:results].first).to have_key(:providedLocation)
      expect(result[:results].first).to have_key(:locations)
      expect(result[:results].first[:locations].first).to have_key(:latLng)
    end
  end
end
