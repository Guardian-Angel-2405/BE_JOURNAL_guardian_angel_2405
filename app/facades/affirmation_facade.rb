class AffirmationFacade
  def self.affirmation_response
    response = AffirmationService.obtain
    aff = Affirmation.new(response)
  end
end