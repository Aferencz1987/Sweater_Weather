require 'rails_helper'

RSpec.describe 'user request' do
  it 'return new user from registration page' do
    VCR.use_cassette 'road trip' do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "91b00681c3d091ebe21e")
      post "/api/v1/road_trip", params:
        {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": "91b00681c3d091ebe21e"
        }

      road_trip_result = JSON.parse(response.body, symbolize_names: true)

      expect(status).to be(200)
    end
  end
  it 'returns error if api key is incorrect' do
    VCR.use_cassette 'bad road trip' do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "91b00681c3d091ebe21e")
      post "/api/v1/road_trip", params:
        {
          "origin": "Denver,CO",
          "destination": "Mars",
          "api_key": "01919283u4632"
        }

      road_trip_result = JSON.parse(response.body, symbolize_names: true)
      expect(road_trip_result[:error]).to eq("Incorrect API key input")
      expect(status).to be(401)
    end
  end
  it 'returns error if trip is impossible' do
    VCR.use_cassette 'bad road trip' do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password", api_key: "91b00681c3d091ebe21e")
      post "/api/v1/road_trip", params:
        {
          "origin": "Denver,CO",
          "destination": "Mars",
          "api_key": "91b00681c3d091ebe21e"
        }

      road_trip_result = JSON.parse(response.body, symbolize_names: true)
      expect(road_trip_result[:data][:attributes][:travel_time]).to eq("Impossible")
      expect(status).to be(400)
    end
  end
end
