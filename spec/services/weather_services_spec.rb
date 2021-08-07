require 'rails_helper'

RSpec.describe 'open weather api' do
  it 'returns weather for location' do
    VCR.use_cassette 'denver weather' do
      result = WeatherService.weather('Denver,CO')

      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:current_weather)
      expect(result[:data][:attributes]).to have_key(:daily_weather)
    end
  end
end
