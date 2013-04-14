FactoryGirl.define do
  factory :route do
    sequence(:number) {|n| "#{n}A"}
    origin 'castries'
    destination 'gros islet'
    path 'express'
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
<<<<<<< HEAD

  factory :passenger do
    sequence(:trip_id) {|n| n}
    sequence(:rider_id) {|n| n}
  end  

  factory :rider do
    sequence(:user_id) {|n| n}
    balance 100.00
  end    

end
=======
end
>>>>>>> 2ff74cd34f00fd6826d8d9ea56683ba6717bdfc7
