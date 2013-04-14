<<<<<<< HEAD
FactoryGirl.define do
  factory :route do
    sequence(:number) {|n| "#{n}A"}
    origin 'castries'
    destination 'gros islet'
    path 'express'
  end

  factory :bus do
    sequence(:license_number) {|n| "#{n}A"}
    capacity 5
    description 'pink flames'
  end

  factory :user do
    sequence(:username) {|n| "user#{n}"}
    sequence(:email) {|n| "email#{n}@gmail.com"}
    password "gobbledygook1" 
    password_confirmation "gobbledygook1" 
    phone '999.222.3333'
    first_name 'Bob'
    last_name 'Hoskins'
  end
end