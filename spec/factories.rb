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

    factory :user_as_rider do
      after(:create) {|user| FactoryGirl.create(:rider, :user => user)}
    end

    factory :admin do
      roles ['admin']
    end
  end

  factory :passenger do
    rider
    trip
  end  

  factory :rider do
    user
    balance 100.00
  end    

  factory :driver do
    sequence(:user_id) {|n| n}
    sequence(:supervisor) {|n| "super#{n}"}
  end    

  factory :trip do
    sequence(:route_id) {|n| n}
    sequence(:driver_id) {|n| n}
    sequence(:bus_id) {|n| n}
    departure Date.today
    factory :trip_with_passengers do
      after(:create) {|trip| FactoryGirl.create(:passenger, :trip => trip)}
    end
  end   
end
