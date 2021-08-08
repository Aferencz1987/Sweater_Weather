require 'rails_helper'

RSpec.describe 'open weather api' do
  it 'returns weather for location' do
    VCR.use_cassette 'denver weather' do
      result = WeatherService.weather(39.738453, -104.984853)

      expect(result).to have_key(:lon)
      expect(result).to have_key(:lat)
      expect(result).to_not have_key(:minutely)
      expect(result[:current]).to have_key(:temp)
      expect(result[:hourly].first).to have_key(:temp)
      expect(result[:daily].first).to have_key(:temp)
      expect(result[:current][:temp]).to eq(67.26) 
    end
  end
end
