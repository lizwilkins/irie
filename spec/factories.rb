FactoryGirl.define do
  factory :route do
    sequence(:number) {|n| "#{n}A"}
    origin 'castries'
    destination 'gros islet'
    path 'express'
  end
end