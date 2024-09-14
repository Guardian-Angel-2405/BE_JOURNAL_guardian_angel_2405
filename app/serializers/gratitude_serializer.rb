class GratitudeSerializer 
  include JSONAPI::Serializer
  attributes :user_id, :entry, :date
end