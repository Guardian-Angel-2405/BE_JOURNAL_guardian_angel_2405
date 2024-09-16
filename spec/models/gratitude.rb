require 'rails_helper'

RSpec.describe Gratitude, type: :model do
  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :entry }
    it { should validate_presence_of :date }
  end
end