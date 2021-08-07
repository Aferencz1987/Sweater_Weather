require 'rails_helper'

RSpec.describe 'open weather api' do
  it 'returns weather for location' do
    VCR.use_cassette 'denver weather' do
      result = WeatherService.weather(39.738453, -104.984853)

      expect(result[:coord]).to have_key(:lon)
      expect(result[:coord]).to have_key(:lat)
      expect(result[:main]).to have_key(:temp)
      expect(result[:main][:temp]).to eq(81.7) #why is it rounding from .57 to 7?
    end
  end
end
