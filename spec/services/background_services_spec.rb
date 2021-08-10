require 'rails_helper'

RSpec.describe 'background api' do
  it 'returns the right link to image' do
    VCR.use_cassette 'image service test' do
      map = MapPoro.new(location: 'Denver,CO', latitude: 39.738453,longitude: -104.984853)
      result = BackgroundService.image(map)

      expect(result[:total]).to eq(5072)
      expect(result[:results].first[:description]).to eq("Night Time Downtown Denver")
      expect(result[:results][0]).to have_key(:urls)
    end
  end
end
