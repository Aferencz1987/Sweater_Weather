require 'rails_helper'

RSpec.describe 'session request' do
  it 'return new session from login' do

    user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")
    post "/api/v1/sessions", params:
      {
        "email": "whatever@example.com",
        "password": "password"
      }

    session_result = JSON.parse(response.body, symbolize_names: true)
    expect(user_result[:data]).to have_key(:attributes)
    expect(user_result[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(status).to be(201)
  end

  it 'will error if wrong login given' do

    post "/api/v1/sessions", params:
      {
        "email": "whatever@example.com",
        "password": "password"
      }
    user_result = JSON.parse(response.body, symbolize_names: true)

    expect(status).to eq(400)
    expect(user_result[:error]).to eq("Incorrect password or email.")
  end
end
