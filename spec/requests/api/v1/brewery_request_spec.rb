require 'rails_helper'

RSpec.describe 'brewery request' do
  it 'can return breweries for location' do
    VCR.use_cassette 'brewery response for denver' do
    location = 'Denver, CO'

    get "/api/v1/brewery?location=#{location}"

    brewery_result = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    expect(brewery_result[:data]).to have_key(:attributes)
    end
  end
end
