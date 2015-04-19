require 'faker'

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
 )
 user.skip_confirmation!
 user.save!
end
users = User.all

25.times do
  Post.create!(
    user: users.sample,
    title:  Faker::Lorem.sentence,
    text:   Faker::Lorem.paragraph(2),
    created_at: Faker::Date.between(10.days.ago, Date.today)
 )
end
posts = Post.all


100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

user = User.first
  user.skip_reconfirmation!
  user.update_attributes!(
    name: 'Ghost',
    email: 'pretend@shufflebox.org',
    password: 'password11'
 )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"