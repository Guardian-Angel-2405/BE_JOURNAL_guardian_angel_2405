class Gratitude < ApplicationRecord
  validates_presence_of :user_id, :gratitude, :date
end