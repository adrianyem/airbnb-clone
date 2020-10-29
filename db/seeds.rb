# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
  { name: "Adrian", address: "Singapore", phone_number: 123456, email: 'a@a.com', password: '123456' },
  { name: "James", address: "Malaysia", phone_number: 654321, email: 'b@b.com', password: '987654' },
])

offers = Offer.create([
  { name: "Two Room Flat", description: "2 room flat with a goodview", owner: users.first },
  { name: "One Room Flat", description: "1 room flat with a goodview", owner: users.first },
  { name: "Three Room Flat", description: "3 room flat with a goodview", owner: users.last },
])

Booking.create(start_time: 3.day.ago, end_time: 1.day.ago, customer: users.last, offer: offers.first)
