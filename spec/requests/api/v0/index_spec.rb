require 'rails_helper'

RSpec.describe 'Gratitude Dates Index', type: :request do
  it 'returns all dates that a user has entered gratitudes' do
    gratitude1 = Gratitude.create!(entry: "I am so grateful", user_id: 1, date: "2024-09-11")
    gratitude2 = create(:gratitude, user_id: 1, date: "2024-09-12")
    gratitude3 = create(:gratitude, user_id: 1, date: "2024-09-13")
    
    gratitude4 = create(:gratitude, user_id: 2, date: "2024-09-13")

    get "/api/v0/gratitudes/#{gratitude1.user_id}/dates"

    dates = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(dates.count).to eq(3)

    dates.each do |date|
      expect(date).to have_key(:attributes)
      expect(date[:attributes]).to be_a(Hash)

      expect(date[:attributes]).to have_key(:user_id)
      expect(date[:attributes][:user_id]).to be_a(String)

      expect(date[:attributes]).to have_key(:date)
      expect(date[:attributes][:date]).to be_a(String)
    end

    first_date = dates.first
    expect(first_date[:attributes][:user_id]).to eq("1")
    expect(first_date[:attributes][:date]).to eq("2024-09-11")
  end
end