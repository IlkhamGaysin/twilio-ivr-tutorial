FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:phone) { Faker::PhoneNumber.phone_number }
end
