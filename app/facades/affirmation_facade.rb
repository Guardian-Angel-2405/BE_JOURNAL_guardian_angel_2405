class AffirmationFacade
  def self.affirmation_response
    AffirmationService.obtain
  end
end