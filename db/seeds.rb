# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Review.destroy_all

def fake_content
  paragraphs = []
  paragraphs << Faker::Lorem.paragraph
  paragraphs << "![](http://lorempixel.com/800/300/city/)"
  paragraphs << "## #{Faker::Company.catch_phrase}"
  paragraphs << Faker::Lorem.paragraphs(2)
  paragraphs << "**#{Faker::Lorem.word}** #{Faker::Lorem.sentences.join}"
  paragraphs << "## #{Faker::Company.catch_phrase}"
  paragraphs << "#{Faker::Lorem.sentences.join} [#{Faker::Commerce.product_name}](#{Faker::Internet.url}) #{Faker::Lorem.sentences.join}"
  paragraphs << Faker::Lorem.paragraphs(3)
  paragraphs.flatten.join("\n\n")
end

20.times do
  Restaurant.create(
    name: "The #{Faker::GameOfThrones.house}",
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"][rand(5)]
  )
end

100.times do
  Review.create(
    content: fake_content,
    rating: rand(5),
    restaurant_id: rand(101..120),
  )
end
