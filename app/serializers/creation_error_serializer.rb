class CreationErrorSerializer 
  def self.error_json
  {
    errors: [
      {
        status: '422',
        detail: "Creation Failed"
      }
    ],
    quote: AffirmationFacade.affirmation_response
  }
  end
end