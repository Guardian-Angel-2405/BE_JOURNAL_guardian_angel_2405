class ErrorSerializer 
  def self.error_json
  {
    errors: [
      {
        status: '404',
        detail: "No Results :("
      }
    ],
    quote: AffirmationFacade.affirmation_response,
  }
  end
end