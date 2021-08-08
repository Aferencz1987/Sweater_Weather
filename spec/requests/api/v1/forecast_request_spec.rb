require 'rails_helper'

RSpec.describe 'forecast request' do
  it 'can compile forecast info for a location' do
    VCR.use_cassette 'forecast request 2' do
    location = 'Denver, CO'

    get "/api/v1/forecast?location=#{location}"

    forecast_result = JSON.parse(response.body, symbolize_names: true)
    expect(forecast_result).to have_key(:attributes)
    end
  end
end
