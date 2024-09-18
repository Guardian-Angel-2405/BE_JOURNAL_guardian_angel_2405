class Affirmation
  attr_reader :affirmation
  
  def initialize(attributes)
    @affirmation = attributes[:affirmation]
  end
end