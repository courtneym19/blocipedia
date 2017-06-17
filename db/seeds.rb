
require 'random_data'

  # Create Users
   10.times do
     User.create!(
     email:    Faker::Internet.email,
     password: "password",
     password_confirmation:  "password"
     )
   end

   users = User.all



  # Create Wikis
   50.times do
     Wiki.create!(
       title:  Faker::Lorem.sentence,
       body: Faker::Lorem.paragraph
     )
   end

   wikis = Wiki.all


  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Wiki.count} wikis created"
