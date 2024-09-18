require "rails_helper"

RSpec.describe "AffirmationFacade" do
  it "should call the facade and retrieve an affirmation" do
    VCR.use_cassette("affirmation_api") do
      response = AffirmationFacade.affirmation_response
      expect(response[:affirmation]).to eq("Small progress is still progress")
    end
  end
end