
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





  # Create Public Wikis
   50.times do
     Wiki.create!(
       title:  Faker::Lorem.sentence,
       body: Faker::Lorem.paragraph
     )
   end

   wikis = Wiki.all

   # Create Private Wikis
    50.times do
      PrivateWiki.create!(
        title:  Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph
      )
    end

    private_wikis = PrivateWiki.all


  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Wiki.count} public wikis created"
  puts "#{PrivateWiki.count} private wikis created"
