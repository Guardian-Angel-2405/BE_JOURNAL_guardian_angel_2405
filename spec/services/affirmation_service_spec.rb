require "rails_helper"

RSpec.describe 'Affirmation' do 
  it 'retrievs a positive affirmation from the API' do
      affirmation = AffirmationService.obtain

      expect(affirmation.size).to eq(1)
      expect(affirmation).to have_key(:affirmation)
      expect(affirmation[:affirmation]).to be_a String
  end
end