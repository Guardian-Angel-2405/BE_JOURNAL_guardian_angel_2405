require 'rails_helper'

RSpec.describe 'Gratitude Date Show', type: :request do
  before(:each) do
    @gratitude1 = Gratitude.create!(entry: "I am so grateful", user_id: 1, date: "2024-09-11")
    @gratitude2 = create(:gratitude, user_id: 1, date: "2024-09-11")
    @gratitude3 = create(:gratitude, user_id: 1, date: "2024-09-11")
    @gratitude4 = create(:gratitude, user_id: 1, date: "2024-09-13")

    @gratitude5 = create(:gratitude, user_id: 2, date: "2024-09-13")
    @gratitude6 = create(:gratitude, user_id: 2, date: "2024-09-13")
  end

  it 'returns all entries that a user has entered on a specific date' do
    get "/api/v0/gratitudes/#{@gratitude1.user_id}/dates/#{@gratitude1.date}"

    entries = JSON.parse(response.body, symbolize_names: true)[:data]
    # binding.pry
    
    expect(entries.count).to eq(3)
  end
end