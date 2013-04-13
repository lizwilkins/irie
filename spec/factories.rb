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
end