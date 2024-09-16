class Gratitude < ApplicationRecord
  validates_presence_of :user_id, :entry, :date
end