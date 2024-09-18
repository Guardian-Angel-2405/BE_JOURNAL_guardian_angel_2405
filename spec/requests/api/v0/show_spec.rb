require 'rails_helper'

RSpec.describe 'Gratitude Date Show', type: :request do
  it 'returns all entries that a user has entered on a specific date' do
    gratitude1 = Gratitude.create!(entry: "I am so grateful", user_id: 1, date: "2024-09-11")
    gratitude2 = create(:gratitude, user_id: 1, date: "2024-09-11")
    gratitude3 = create(:gratitude, user_id: 1, date: "2024-09-11")
    gratitude4 = create(:gratitude, user_id: 1, date: "2024-09-13")

    gratitude5 = create(:gratitude, user_id: 2, date: "2024-09-13")
    gratitude6 = create(:gratitude, user_id: 2, date: "2024-09-13")

    get "/api/v0/gratitudes/#{gratitude1.user_id}/dates/#{gratitude1.date}"
    
    entries = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(entries.count).to eq(3)

    entries.each do |user_entry|
      expect(user_entry).to have_key(:attributes)
      expect(user_entry[:attributes]).to be_a(Hash)

      expect(user_entry[:attributes]).to have_key(:user_id)
      expect(user_entry[:attributes][:user_id]).to be_a(String)

      expect(user_entry[:attributes]).to have_key(:entry)
      expect(user_entry[:attributes][:entry]).to be_a(String)

      expect(user_entry[:attributes][:quote]).to have_key(:affirmation)
      expect(user_entry[:attributes][:quote]).to be_a(Hash)

      expect(user_entry[:attributes]).to_not have_key(:date)
      expect(user_entry[:attributes][:date]).to_not be_a(String)
    end

    first_entry = entries.first
    expect(first_entry[:attributes][:user_id]).to eq("1")
    expect(first_entry[:attributes][:entry]).to eq("I am so grateful")
  end

  it 'returns an error message if the url is incorrect' do
    gratitude1 = Gratitude.create!(entry: "I am so grateful", user_id: 1, date: "2024-09-11")
    gratitude2 = create(:gratitude, user_id: 1, date: "2024-09-11")

    get "/api/v0/gratitudes/2/dates/#{gratitude1.date}"
    
    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to have_key(:errors)
    expect(error).to have_key(:quote)
    expect(error).to be_a(Hash)

    expect(error[:errors]).to be_an(Array)
    expect(error[:errors][0][:status]).to eq("404")
    expect(error[:errors][0][:detail]).to eq("No Results :(")
    
    expect(error[:quote][:affirmation]).to be_a(String)
  end
end