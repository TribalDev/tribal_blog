require 'faker'
FactoryGirl.define do
 factory :post do
   title Faker::Name.title  
    text Faker::Lorem.paragraph(2)
 end
end