class EntrySerializer 
  include JSONAPI::Serializer
  attributes :user_id, :entry
end