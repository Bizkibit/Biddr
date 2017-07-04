# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bid.destroy_all
Auction.destroy_all
User.destroy_all

User.create([
  {first_name: 'Farshid', last_name: 'HM', email: 'admin@admin.com', password: 'pass123', is_admin: true},
  {first_name: 'Homer', last_name: 'Simpson', email: 'homer@biddr.com', password: 'pass123'},
  {first_name: 'Marge', last_name: 'Simpson', email: 'marge@biddr.com', password: 'pass123'}
  ])

users = User.all

20.times do
  Auction.create({
                  title: Faker::Hacker.say_something_smart,
                  detail: Faker::Hipster.paragraph,
                  end_on: Time.now+rand(1..30).days,
                  reserve_price: rand(100..500),
                  user: users.sample

    })
end

auctions = Auction.all

50.times do
  auction = auctions.sample
  Bid.create({
              price: rand(100..500),
              auction: auction,
              user: (users - [auction.user]).sample
    })
end

puts "Done Seeding!"
