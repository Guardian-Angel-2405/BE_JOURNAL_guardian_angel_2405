require "rails_helper"

RSpec.describe 'Affirmation' do 
  it 'searches our API for a food item' do
    VCR.use_cassette("affirmation_api") do
      affirmation = AffirmationService.obtain

      expect(affirmation.size).to eq(1)
      expect(affirmation).to have_key(:affirmation)
      expect(affirmation[:affirmation]).to be_a String
    end
  end
end