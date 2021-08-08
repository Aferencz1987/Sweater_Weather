require 'rails_helper'

RSpec.describe 'weather facade' do
  it 'returns weather' do
    VCR.use_cassette 'denver weather' do
      result = WeatherFacade.weather(39.738453, -104.984853)

      expect(result[:data]).to have_key(:id)
      expect(result[:data][:id]).to eq(null)
      expect(result[:data][:attributes]).to have_key(:current_weather)
      expect(result[:data][:attributes]).to have_key(:daily_weather)
      expect(result[:data][:attributes]).to have_key(:hourly_weather)
      #  maybe an issue from the service expect(result[:main][:temp]).to eq(81.7) #why is it rounding from .57 to 7?
    end
  end
end
