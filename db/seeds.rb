# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 1. Clean the database 🗑️
puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

# 2. Create the instances 🏗️
puts "Creating restaurants..."
Restaurant.create!(name: "First Hong Kong Cafe", address: "117 SE 2nd St, Miami, FL 33131", phone_number: "305-808-6665", category: "chinese")
puts "Created First Hong Kong Cafe"
Restaurant.create!(name: "Rosaluna Cafe", address: "200 S Biscayne Blvd, Miami, FL 33131", phone_number: "305-561-5667", category: "italian")
puts "Created Rosaluna Cafe"
Restaurant.create!(name: "Zuma Miami", address: "270 Biscayne Blvd Way, Miami, FL 33131", phone_number: "305-577-0277", category: "japanese")
puts "Created Zuma Miami"
Restaurant.create!(name: "Claudie", address: "1101 Brickell Ave S-113, Miami, FL 33131", phone_number: "305-990-1101", category: "french")
puts "Created Claudie"
Restaurant.create!(name: "Boulud Sud Miami", address: "255 Biscayne Blvd Way, Miami, FL 33131", phone_number: "305-421-8800", category: "belgian")
puts "Created Boulud Sud Miami"

# 3. Display a message 🎉
puts "Finished! Created #{Restaurant.count} restaurants."
