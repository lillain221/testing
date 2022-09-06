user_pictures = []
require "csv"
6.times do
  user_pictures << URI.parse(Faker::LoremFlickr.image).open
end

me = User.create(email: "chris@typefast.co", password: "password",admin:true)



5.times do |i|
  user = User.create(email: Faker::Internet.email, password: "password")
end

9.times do |i|
  property = Property.create!(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraphs(number: 30).join(" "),
    price: Money.from_amount((25..100).to_a.sample)
  )

  property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "property_#{i + 1}.jpg")), filename: property.name)
  


  (1..5).to_a.sample.times do
    Review.create(reviewable: property, rating: (1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph, user: User.all.sample)
  end
end

CSV.foreach("db/x-ken-all.csv", encoding: 'UTF-8') do |info|
  Postal.create(
    postal_code: info[0],
    prefecture: info[1],
    city: info[2],
    town: info[3],
    )
end