class EntrySerializer 
  include JSONAPI::Serializer
  attributes :user_id, :entry

  attribute :quote do |object|
    AffirmationFacade.affirmation_response
  end
end