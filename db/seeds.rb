# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting notifications..."
Notification.destroy_all
puts "Deleting passengers..."
PassengerRequest.destroy_all
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
user1 = User.create(email: "yassir@test.com", first_name: "Yassir", last_name: "El Bakkali", password: "123456")
user1.photo.attach(io: file, filename: "avatar_yassir.png", content_type: "image/jpeg")
user1.save!

file = URI.open('https://avatars.githubusercontent.com/u/145115764?v=4')
user2 = User.create(email: "gauthier@test.com", first_name: "Gauthier", last_name: "Lepour", password: "123456")
user2.photo.attach(io: file, filename: "avatar_gauthier.png", content_type: "image/jpeg")
user2.save!

file = URI.open('https://avatars.githubusercontent.com/u/96615504?v=4')
user3 = User.create(email: "benjamin@test.com", first_name: "Benjamin", last_name: "Moreau", password: "123456")
user3.photo.attach(io: file, filename: "avatar_benjamin.png", content_type: "image/jpeg")
user3.save!

file = URI.open('https://avatars.githubusercontent.com/u/155843655?v=4')
user4 = User.create(email: "jonathan@test.com", first_name: "Jonathan", last_name: "Elst", password: "123456")
user4.photo.attach(io: file, filename: "avatar_jonathan.png", content_type: "image/jpeg")
user4.save!

file = URI.open('https://del.h-cdn.co/assets/17/07/3200x3200/square-1487365300-delish-ryan-gosling-getty-pascal.jpg')
user5 = User.create(email: "gosling@test.com", first_name: "Ryan", last_name: "Gosling", password: "123456")
user5.photo.attach(io: file, filename: "avatar_gosling.png", content_type: "image/jpeg")
user5.save!

file = URI.open('https://avatars.githubusercontent.com/u/124592546?v=4')
user6 = User.create(email: "nicolas@test.com", first_name: "Nicolas", last_name: "Nève de Mévergnies", password: "123456")
user6.photo.attach(io: file, filename: "avatar_nicolas.png", content_type: "image/jpeg")
user6.save!

file = URI.open('https://avatars.githubusercontent.com/u/154889212?v=4')
user7 = User.create(email: "pauline@test.com", first_name: "Pauline", last_name: "van Rijckevorsel", password: "123456")
user7.photo.attach(io: file, filename: "avatar_pauline.png", content_type: "image/jpeg")
user7.save!

file = URI.open('https://avatars.githubusercontent.com/u/156318922?v=4')
user8 = User.create(email: "caroline@test.com", first_name: "Caroline", last_name: "Deuse", password: "123456")
user8.photo.attach(io: file, filename: "avatar_caroline.png", content_type: "image/jpeg")
user8.save!

file = URI.open('https://avatars.githubusercontent.com/u/156615838?v=4')
user9 = User.create(email: "geoffroy@test.com", first_name: "Geoffroy", last_name: "de Cooman", password: "123456")
user9.photo.attach(io: file, filename: "avatar_geoffroy.png", content_type: "image/jpeg")
user9.save!

file = URI.open('https://avatars.githubusercontent.com/u/70776288?v=4')
user10 = User.create(email: "pedro@test.com", first_name: "Pedro", last_name: "Pan", password: "123456")
user10.photo.attach(io: file, filename: "avatar_pedro.png", content_type: "image/jpeg")
user10.save!

puts "Users created."

puts "Creating cars..."

car1 = Car.create(brand: "Mercedes-Benz", model: "AMG 335", color: "White", license_plate: "C4R-R0T", user: user1)
car2 = Car.create(brand: "Audi", model: "R8", color: "Grey", license_plate: "1ZO-NE1", user: user5)
car3 = Car.create(brand: "Peugeot", model: "308", color: "Black", license_plate: "P3D-R00", user: user10)
car4 = Car.create(brand: "Renault", model: "455", color: "Black", license_plate: "C4R-0LN", user: user8)
car5 = Car.create(brand: "Bugatti", model: "Veyron", color: "Dark Blue", license_plate: "J0F-R01", user: user9)

puts "Cars created."

puts "Creating events..."

file = URI.open("https://assets.newatlas.com/dims4/default/5eb889b/2147483647/strip/true/crop/2000x1331+0+0/resize/2000x1331!/quality/90/?url=http%3A%2F%2Fnewatlas-brightspot.s3.amazonaws.com%2F5f%2F5c%2F348d6a3a4e9fb7d90f1a26e0c305%2Fdepositphotos-34452711-l-2015.jpg")
event1 = Event.create(name: "Flocon's birthday",
                      description: "My bunny is getting old... celebrating her birthday soon, please come at my house ! see ya friends ! (^o^)/",
                      address: "Wavre",
                      start_time: "2024-03-15 09:00:00",
                      end_time: "2024-03-15 16:00:00",
                      user: user1)
event1.photo.attach(io: file, filename: "rabbit_event.png", content_type: "image/jpeg")
event1.save!

file = URI.open("https://img.freepik.com/free-photo/groom-putting-ring-bride-s-finger_1157-338.jpg")
event2 = Event.create(name: "Jonathan's wedding",
                      description: "Celebrating our union with Jonathania soon. We'll be exchanging vows, enjoying
                       fantastic food, and dancing the night away.",
                      address: "Anvers",
                      start_time: "2024-03-16 18:00:00",
                      end_time: "2024-03-16 23:00:00",
                      user: user4)
event2.photo.attach(io: file, filename: "wedding_event.png", content_type: "image/jpeg")
event2.save!

file = URI.open("https://cdn.britannica.com/97/158797-050-ABECB32F/North-Cascades-National-Park-Lake-Ann-park.jpg")
event3 = Event.create(name: "Fishing contest",
                      description: "I am stuck somewhere for a few weeks and I'm getting bored
                      , I was thinking of inviting some friends to have a relaxing time at a lake nearby.",
                      address: "Liège",
                      start_time: "2024-04-16 13:00:00",
                      end_time: "2024-04-16 23:00:00",
                      user: user2)
event3.photo.attach(io: file, filename: "fishing_event.png", content_type: "image/jpeg")
event3.save!

puts "Events created."

puts "Creating rides..."

ride1 = Ride.create(departure_place: "Liège",
                    arrival_place: "Anvers",
                    price: 17,
                    event: event2,
                    car: car1,
                    seats: 3,
                    departure_time: "2024-03-16 08:00:00",
                    description: "No smoking in my car. But you can choose the
                    music if you want to. Also, my rabbit is sitting in the front seat.")

ride2 = Ride.create(departure_place: "Bruxelles",
                    arrival_place: "Anvers",
                    price: 12,
                    event: event2,
                    car: car3,
                    seats: 4,
                    departure_time: "2024-03-16 08:20:00",
                    description: "You may hear some noise in the trunk, don't worry about it.")

ride3 = Ride.create(departure_place: "Bruxelles",
                    arrival_place: "Anvers",
                    price: 5,
                    event: event2,
                    car: car2,
                    seats: 1,
                    departure_time: "2024-03-16 08:45:00",
                    description: "You need to apply some force on the handle if you open
                    the front passenger seat.")

ride4 = Ride.create(departure_place: "Bruxelles",
                    arrival_place: "Liège",
                    price: 89,
                    event: event1,
                    car: car2,
                    seats: 4,
                    departure_time: "2024-03-16 08:45:00")

ride5 = Ride.create(departure_place: "Arlon",
                    arrival_place: "Anvers",
                    price: 54,
                    event: event2,
                    car: car4,
                    seats: 1,
                    departure_time: "2024-03-16 08:45:00",
                    description: "There is only one seat available because I'm also bringing my three cats on the
                    travel.")

ride5 = Ride.create(departure_place: "Arlon",
                    arrival_place: "Wavre",
                    price: 54,
                    event: event1,
                    car: car4,
                    seats: 1,
                    departure_time: "2024-03-16 08:45:00",
                    description: "There is only one seat available because I'm also bringing my three cats on the
                    travel.")

ride6 = Ride.create(departure_place: "Wavre",
                    arrival_place: "Anvers",
                    price: 36,
                    event: event2,
                    car: car5,
                    seats: 4,
                    departure_time: "2024-03-16 08:45:00",
                    description: "Be aware that I like my music loud. Also you can't choose
                    the playlist.")

ride7 = Ride.create(departure_place: "Bruxelles",
                    arrival_place: "Liège",
                    price: 89,
                    event: event1,
                    car: car3,
                    seats: 4,
                    departure_time: "2024-03-16 08:45:00")

puts "Rides created."

puts "Creating memberships..."

Membership.create(user: user1, event: event2, role: "driver")
Membership.create(user: user1, event: event3, role: "passenger")
Membership.create(user: user8, event: event2, role: "driver")
Membership.create(user: user10, event: event2, role: "driver")
Membership.create(user: user9, event: event2, role: "driver")
Membership.create(user: user3, event: event2, role: "passenger")
Membership.create(user: user7, event: event2, role: "passenger")
Membership.create(user: user6, event: event2, role: "passenger")
Membership.create(user: user5, event: event2, role: "driver")
Membership.create(user: user5, event: event1, role: "passenger")
Membership.create(user: user10, event: event1, role: "passenger")
Membership.create(user: user2, event: event1, role: "passenger")
