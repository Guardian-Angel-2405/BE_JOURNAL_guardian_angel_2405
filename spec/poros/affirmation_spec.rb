require "rails_helper"

RSpec.describe Affirmation do
  it "exists" do
    attrs = { affirmation: "You'll find a way" }

    aff = Affirmation.new(attrs)

    expect(aff).to be_a Affirmation
    expect(aff.affirmation).to eq("You'll find a way")
  end
end