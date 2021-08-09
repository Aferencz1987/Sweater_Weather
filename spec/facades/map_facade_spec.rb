require 'rails_helper'

RSpec.describe 'map facade' do
  it 'returns lat and lon' do
    VCR.use_cassette 'denver map' do
      result = MapFacade.coordinates('Denver,CO')

      expect(result.location).to eq('Denver,CO')
      expect(result.latitude).to eq(39.738453)
      expect(result.longitude).to eq(-104.984853)
    end
  end
end
