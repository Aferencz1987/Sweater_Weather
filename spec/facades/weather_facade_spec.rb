require 'rails_helper'

RSpec.describe 'weather facade' do
  it 'returns weather' do
    VCR.use_cassette 'denver weather' do
      result = WeatherFacade.weather(39.738453, -104.984853)
# require "pry"; binding.pry
      expect(result.current_datetime).to eq(1628393753)
      expect(result.current_description).to eq("clear sky")
      expect(result.current_feels_like).to eq(65.75)

    end
  end
end
