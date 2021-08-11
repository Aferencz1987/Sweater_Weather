require 'rails_helper'

RSpec.describe 'background request' do
  it 'can provide a background image' do
    VCR.use_cassette 'background' do
    location = 'Denver, CO'

    get "/api/v1/background?location=#{location}"

    background_result = JSON.parse(response.body, symbolize_names: true)
    expect(background_result[:data]).to have_key(:attributes)
    expect(background_result[:data][:attributes]).to have_key(:image)
    expect(background_result[:data][:attributes][:image][:image_url]).to eq("https://unsplash.com/photos/A4RpHR83luM")
    end
  end
end
