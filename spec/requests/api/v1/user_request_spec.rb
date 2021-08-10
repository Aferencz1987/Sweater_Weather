require 'rails_helper'

RSpec.describe 'user request' do
  it 'return new user from registration page' do

    post "/api/v1/users", params:
      {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

    user_result = JSON.parse(response.body, symbolize_names: true)
    expect(user_result[:data]).to have_key(:attributes)
    expect(user_result[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(status).to be(201)
  end

  it 'will error if repeat registration email given' do

    post "/api/v1/users", params:
      {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
    expect(status).to eq(201)

    post "/api/v1/users", params:
      {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
    user_result = JSON.parse(response.body, symbolize_names: true)

    expect(status).to eq(400)
    expect(user_result[:error]).to eq("Email already registered. Please login to continue")
  end
  it 'will error if password and password confirm dont match' do

    post "/api/v1/users", params:
      {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "notthesamepassword"
      }
    user_result = JSON.parse(response.body, symbolize_names: true)

    expect(status).to eq(400)
    expect(user_result[:error]).to eq("Please make sure your password and password confirmation match.")
  end
end
