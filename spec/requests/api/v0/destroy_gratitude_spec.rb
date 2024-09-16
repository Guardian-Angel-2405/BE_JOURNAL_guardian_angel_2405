require 'rails_helper'

RSpec.describe "Destroy" do 
  describe "happy path" do 
    it "can delete a gratitude entry" do 
      gratitude1 = create(:gratitude, user_id: 1)
      gratitude2 = create(:gratitude, user_id: 1)

      expect(Gratitude.count).to eq(2)
            
      headers = {"CONTENT_TYPE" => "application/json"}
      delete "/api/v0/gratitudes/#{gratitude2.id}", headers: headers
      
      expect(response).to be_successful
      expect(Gratitude.count).to eq(1)
    end
  end
end
  