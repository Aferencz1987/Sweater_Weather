require 'rails_helper'

RSpec.describe 'brewery request' do
  xit 'can return breweries for location' do
    VCR.use_cassette 'brewery response for denver' do
    location = 'Denver, CO'
    quantity = 3
    get "/api/v1/brewery?location=#{location}&quantity=#{quantity}"

    brewery_result = JSON.parse(response.body, symbolize_names: true)
    expect(brewery_result[:data]).to have_key(:attributes)
    end
  end

  xit 'will error if bad quantity given' do
    VCR.use_cassette 'brewery response for denver' do
    location = 'Denver, CO'
    quantity = -1
    get "/api/v1/brewery?location=#{location}&quantity=#{quantity}"

    brewery_result = JSON.parse(response.body, symbolize_names: true)

    expect(brewery_result[:error]).to eq('Please choose a number greater than 0')
    end
  end
end
