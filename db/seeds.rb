require 'faker'
 20.times do
   post = Post.create!(
     title:  Faker::Lorem.sentence,
     text:   Faker::Lorem.paragraph(2),
   )
 end   

