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

post1 = Post.find_by(title: "The Glorious Mountain Ever!")
post2 = Post.find_by(title: "The Glorious River Ever!")
post3 = Post.find_by(title: "The Glorious Fruit Ever!")

if !post1
  post1 = Post.create(title: "The Glorious Mountain Ever!",
    body: "Some mountain standing on earth...")
  post1.banner_image.attach(io: File.open(Rails.root.join("public/mountain.jpg")), filename: "mountain.jpg")
end

if !post2
  post2 = Post.create(title: "The Glorious River Ever!",
    body: "Some river flows through the earth...")
  post2.banner_image.attach(io: File.open(Rails.root.join("public/river.jpg")), filename: "river.jpg")
end

if !post3
  post3 = Post.create(title: "The Glorious Fruit Ever!",
    body: "Some fruit shines in the man and woman...")
  post3.banner_image.attach(io: File.open(Rails.root.join("public/fruit.jpg")), filename: "river.jpg")
end
