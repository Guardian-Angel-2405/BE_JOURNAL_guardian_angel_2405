require 'rails_helper'

RSpec.describe "Create" do 
  describe "happy path" do 
    it "can create a gratitude entry" do 
      gratitude1 = create(:gratitude, user_id: 1)

      gratitude_attrs = ({
        user_id: 1,
        entry: "I love this world",
        date: Date.today.to_s
      })
      
      headers = {"CONTENT_TYPE" => "application/json"}
      expect(Gratitude.count).to be 1
      post "/api/v0/gratitudes", headers: headers, params: JSON.generate(gratitude: gratitude_attrs)
      
      expect(response).to be_successful
      expect(Gratitude.count).to be 2
      gratitude = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

      expect(gratitude).to have_key(:user_id)
      expect(gratitude[:user_id]).to be_a String
      expect(gratitude[:user_id]).to eq("1")

      expect(gratitude).to have_key(:entry)
      expect(gratitude[:entry]).to be_a String
      expect(gratitude[:entry]).to eq("I love this world")

      expect(gratitude).to have_key(:date)
      expect(gratitude[:date]).to be_a String
      expect(gratitude[:date]).to eq(Date.today.to_s)

      expect(gratitude).to have_key(:quote)
      expect(gratitude[:quote]).to be_a Hash
      expect(gratitude[:quote][:affirmation]).to be_a String
    end
  end
end