class GratitudeSerializer 
  include JSONAPI::Serializer
  attributes :user_id, :entry, :date

  attribute :quote do |object|
    AffirmationFacade.affirmation_response
  end
end