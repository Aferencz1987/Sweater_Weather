require 'rails_helper'

RSpec.describe 'road trip facade' do
  it 'returns travel details' do
    VCR.use_cassette 'denver to bend' do
      start = 'Denver,CO'
      finish = 'Bend,OR'

      result = RoadTripFacade.trip_details(start, finish)
      expect(result.travel_time).to eq("16:13:11")
    end
  end

  it 'error if travel is impossible' do
    VCR.use_cassette 'denver to mars' do
      start = 'Denver,CO'
      finish = 'Mars'

      result = RoadTripFacade.trip_details(start, finish)
      expect(result).to eq(false)
    end
  end
end
