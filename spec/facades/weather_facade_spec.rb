require 'rails_helper'

RSpec.describe 'weather facade' do
  it 'returns weather' do
    VCR.use_cassette 'denver weather' do
      result = WeatherFacade.weather(39.738453, -104.984853)

      expect(result.current_datetime.to_s).to eq("2021-08-07 21:35:53 -0600")
      expect(result.current_condition).to eq("clear sky")
      expect(result.current_feels_like).to eq(65.75)
      expect(result.hourly_weather.count).to eq(8)
      expect(result.daily_weather.count).to eq(5)
    end
  end
end
