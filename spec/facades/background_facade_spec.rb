require 'rails_helper'

RSpec.describe 'background facade' do
  it 'returns image' do
    VCR.use_cassette 'image service test' do
      map = MapPoro.new(location: 'Denver,CO', latitude: 39.738453,longitude: -104.984853)
      result = BackgroundFacade.image(map)

      expect(result.image).to have_key(:location)
      expect(result.image[:image_url]).to eq("https://unsplash.com/photos/A4RpHR83luM")
    end
  end
end
