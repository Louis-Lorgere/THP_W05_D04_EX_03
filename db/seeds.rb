# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
City.destroy_all
Comment.destroy_all
Gossip.destroy_all
Like.destroy_all
JoinTableGossipComment.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all 

City.create(name: "Kalidor", zip_code: "66666")
City.create(name: "Mos Espa", zip_code: "55666")
City.create(name: "Gotham", zip_code: "44666")
City.create(name: "Lorgeger Town", zip_code: "33666")
City.create(name: "Akon City", zip_code: "22666")
City.create(name: "Disney World", zip_code: "11666")
City.create(name: "Wakanda", zip_code: "99666")
City.create(name: "South Park", zip_code: "88666")
City.create(name: "Halo", zip_code: "77666")
City.create(name: "Dans mon cul", zip_code: "00666")



City.all.each do |i|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: i, email: Faker::Internet.email(domain: "lorgeger"), description: Faker::Movies::HarryPotter.quote, age: rand(10..90))
end

20.times do
  Gossip.create(title: Faker::Music::Hiphop.artist, content: Faker::Superhero.power, user: User.all.sample(1).first)
end

10.times do 
  Tag.create(title: Faker::Books::Dune.quote)
end

Gossip.all.each do |i|
  array = Array.new
  rand(1..3).times do 
    j = rand(0..3)
    while array.include?(j) == true
      j = rand(0..3)
    end
    JoinTableGossipComment.create(gossip: i, tag: Tag.all[j])
    array.push(j)
  end
end

20.times do 
  j = rand(0..9)
  i = rand(0..9)
  while j == i
    i = rand(0..9)
  end
  PrivateMessage.create(content: Faker::Movies::BackToTheFuture.quote, recipient: User.all[j], sender: User.all[i])
end

20.times do 
  Comment.create(content: Faker::Movies::PrincessBride.quote, gossip: Gossip.all.sample(1).first, user: User.all.sample(1).first)
end

20.times do
  j = rand(1..2)
  if j == 1
    Like.create(comment: Comment.all.sample(1).first, user: User.all.sample(1).first)
  else
    Like.create(gossip: Gossip.all.sample(1).first, user: User.all.sample(1).first)
  end
end

