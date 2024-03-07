# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting rides..."
Ride.destroy_all
puts "Deleting cars..."
Car.destroy_all
puts "Deleting events..."
Event.destroy_all
puts "Deleting users..."
User.destroy_all

puts "Creating users..."

file = URI.open("https://avatars.githubusercontent.com/u/141559562?v=4")
user1 = User.create(email: "yassir@test.com", first_name: "Yassir", last_name: "EL BAKKALI", password: "123456")
user1.photo.attach(io: file, filename: "avatar_yassir.png", content_type: "image/jpeg")
user1.save!

file = URI.open('https://avatars.githubusercontent.com/u/145115764?v=4')
user2 = User.create(email: "gauthier@test.com", first_name: "Gauthier", last_name: "LEPOUR", password: "123456")
user2.photo.attach(io: file, filename: "avatar_gauthier.png", content_type: "image/jpeg")
user2.save!

file = URI.open('https://avatars.githubusercontent.com/u/96615504?v=4')
user3 = User.create(email: "benjamin@test.com", first_name: "Benjamin", last_name: "MOREAU", password: "123456")
user3.photo.attach(io: file, filename: "avatar_benjamin.png", content_type: "image/jpeg")
user3.save!

file = URI.open('https://avatars.githubusercontent.com/u/155843655?v=4')
user4 = User.create(email: "john@test.com", first_name: "Jonathan", last_name: "ELST", password: "123456")
user4.photo.attach(io: file, filename: "avatar_jonathan.png", content_type: "image/jpeg")
user4.save!

file = URI.open('https://del.h-cdn.co/assets/17/07/3200x3200/square-1487365300-delish-ryan-gosling-getty-pascal.jpg')
user5 = User.create(email: "gosling@test.com", first_name: "Ryan", last_name: "GOSLING", password: "123456")
user5.photo.attach(io: file, filename: "avatar_gosling.png", content_type: "image/jpeg")
user5.save!

puts "Users created."

puts "Creating cars..."

car1 = Car.create(brand: "Mercedes-Benz", model: "AMG 335", color: "White", license_plate: "C4R_R0T", user: user1)
car2 = Car.create(brand: "Audi", model: "R8", color: "Grey", license_plate: "1ZO-NE1", user: user5)
car3 = Car.create(brand: "Peugeot", model: "308", color: "Black", license_plate: "B3N-J4M", user: user3)

puts "Cars created."

puts "Creating events..."

file = URI.open("https://assets.newatlas.com/dims4/default/5eb889b/2147483647/strip/true/crop/2000x1331+0+0/resize/2000x1331!/quality/90/?url=http%3A%2F%2Fnewatlas-brightspot.s3.amazonaws.com%2F5f%2F5c%2F348d6a3a4e9fb7d90f1a26e0c305%2Fdepositphotos-34452711-l-2015.jpg")
event1 = Event.create(name: "Flocon's birthday",
                      description: "My bunny is getting old... celebrating her birthday soon, please come at my house ! see ya friends ! (^o^)/",
                      address: "Rue des lapins",
                      start_time: "2024-03-15 09:00:00",
                      end_time: "2024-03-15 16:00:00",
                      user: user1)
event1.photo.attach(io: file, filename: "rabbit_event.png", content_type: "image/jpeg")
event1.save!

file = URI.open("https://img.freepik.com/free-photo/groom-putting-ring-bride-s-finger_1157-338.jpg")
event2 = Event.create(name: "Jonathan's wedding",
                      description: "Celebrating our union soon. We'll be exchanging vows, enjoying fantastic food, and dancing the night away.",
                      address: "Avenue of happiness 45",
                      start_time: "2024-03-16 18:00:00",
                      end_time: "2024-03-16 23:00:00",
                      user: user4)
event2.photo.attach(io: file, filename: "wedding_event.png", content_type: "image/jpeg")
event2.save!

puts "Events created."

puts "Creating rides..."

ride1 = Ride.create(departure_place: "Rue des lapins",
                    arrival_place: "Avenue of happiness 45",
                    price: 17,
                    event: event2,
                    car: car1,
                    seats: 4,
                    departure_time: "2024-03-16 08:00:00")

ride2 = Ride.create(departure_place: "Bread Street 89",
                    arrival_place: "Avenue of happiness 45",
                    price: 12,
                    event: event2,
                    car: car3,
                    seats: 4,
                    departure_time: "2024-03-16 08:20:00")

ride3 = Ride.create(departure_place: "Driver Avenue 89",
                    arrival_place: "Avenue of happiness 45",
                    price: 5,
                    event: event2,
                    car: car2,
                    seats: 1,
                    departure_time: "2024-03-16 08:45:00")

ride4 = Ride.create(departure_place: "Driver Avenue 89",
                    arrival_place: "Rue des lapins",
                    price: 89,
                    event: event1,
                    car: car2,
                    seats: 4,
                    departure_time: "2024-03-16 08:45:00")

puts "Rides created."
