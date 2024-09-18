require 'rails_helper'

RSpec.describe 'Affirmation API Response', type: :request do
  it "returns an inspirational quote when this endpoint is hit" do
    VCR.use_cassette("affirmation_api") do
      get "/api/v0/affirmations"

      aff = JSON.parse(response.body, symbolize_names: true)

      expect(aff.count).to eq(1)
      expect(aff[:affirmation]).to be_a(String)
      expect(aff[:affirmation]).to eq("Small progress is still progress")
    end
  end
end