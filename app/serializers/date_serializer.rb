class DateSerializer 
  include JSONAPI::Serializer
  attributes :user_id, :date

  attribute :quote do |object|
    AffirmationFacade.affirmation_response
  end
end