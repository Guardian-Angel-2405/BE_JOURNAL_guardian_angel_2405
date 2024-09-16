# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

gratitude1 = Gratitude.create!(entry: "I am so grateful", user_id: 1, date: "2024-09-11")
gratitude2 = create(:gratitude, user_id: 1, date: "2024-09-12")
gratitude3 = create(:gratitude, user_id: 1, date: "2024-09-13")

gratitude4 = create(:gratitude, user_id: 2, date: "2024-09-13")
