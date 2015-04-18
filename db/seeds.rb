require 'faker'
 25.times do
   post = Post.create!(
     title:  Faker::Lorem.sentence,
     text:   Faker::Lorem.paragraph(2),
     created_at: Faker::Date.between(10.days.ago, Date.today)
   )
 end
