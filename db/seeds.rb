# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_by(email_address: "admin@test.com", role: :admin)

if !user
  User.create(email_address: "admin@test.com", password: "admin1234", role: :admin)
end

post = Post.find_by(title: "The Glorious Mountain Ever!")

if !post
  post = Post.create(title: "The Glorious Mountain Ever!",
    body: "Some mountain")
  post.banner_image.attach(io: File.open(Rails.root.join("public/mountain.jpg")), filename: "mountain.jpg")
end
