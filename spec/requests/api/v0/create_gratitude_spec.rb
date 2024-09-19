require 'rails_helper'

RSpec.describe "Create" do 
  describe "happy path" do 
    it "can create a gratitude entry" do 
      gratitude1 = create(:gratitude, user_id: "1")

      gratitude_attrs = ({
        user_id: "1",
        entry: "I love this world",
        date: Date.today.to_s
      })

      headers = {"CONTENT_TYPE" => "application/json"}
      expect(Gratitude.count).to be 1
      post "/api/v0/gratitudes", headers: headers, params: JSON.generate(gratitude_attrs, user_id: gratitude_attrs[:user_id])
    
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

  describe "sad path" do 
    it "cannot create a gratitude entry with no user id" do 
      gratitude1 = create(:gratitude, user_id: "1")

      gratitude_attrs = ({
        user_id: "",
        entry: "I love this world",
        date: Date.today.to_s
      })

      headers = {"CONTENT_TYPE" => "application/json"}
      expect(Gratitude.count).to be 1
      post "/api/v0/gratitudes", headers: headers, params: JSON.generate(gratitude_attrs, user_id: gratitude_attrs[:user_id])

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      expect(Gratitude.count).to be 1
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:errors]).to be_an(Array)
      expect(data[:errors][0][:status]).to eq("422")
      expect(data[:errors][0][:detail]).to eq("Creation Failed")
    end

    it "cannot create a gratitude entry with no entry" do 
      gratitude1 = create(:gratitude, user_id: "1")

      gratitude_attrs = ({
        user_id: "1",
        entry: "",
        date: Date.today.to_s
      })

      headers = {"CONTENT_TYPE" => "application/json"}
      expect(Gratitude.count).to be 1
      post "/api/v0/gratitudes", headers: headers, params: JSON.generate(gratitude_attrs, user_id: gratitude_attrs[:user_id])

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      expect(Gratitude.count).to be 1
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:errors]).to be_an(Array)
      expect(data[:errors][0][:status]).to eq("422")
      expect(data[:errors][0][:detail]).to eq("Creation Failed")
    end

    it "cannot create a gratitude entry with no date" do 
      gratitude1 = create(:gratitude, user_id: "1")

      gratitude_attrs = ({
        user_id: "1",
        entry: "I love this world",
        date: ""
      })

      headers = {"CONTENT_TYPE" => "application/json"}
      expect(Gratitude.count).to be 1
      post "/api/v0/gratitudes", headers: headers, params: JSON.generate(gratitude_attrs, user_id: gratitude_attrs[:user_id])

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      expect(Gratitude.count).to be 1
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:errors]).to be_an(Array)
      expect(data[:errors][0][:status]).to eq("422")
      expect(data[:errors][0][:detail]).to eq("Creation Failed")
    end
  end
end