# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..20).map do |user, i| 
  User.create(:user => 
  {:username => "user#{i}", :email => "user#{i}@gmail.com", :password => 'ann', :password_confirmation => 'ann'})
end

(1..20).map riders = [
        {:user_id => 1, :balance => '100.00'},
        {:user_id => 2, :balance => '100.00'}]
passengers = [
        {:trip_id => 1, :rider_id => },
        {:trip_id => 2, :rider_id => }]
drivers = [
        {:user_id => 1, :supervisor => 'tim'},
        {:user_id => 2, :supervisor => 'tim'}]
routes = [
        {:number => '1B', :origin => 'Castries', :destination => 'Soufriere', :path => 'A'},
        {:number => '1A', :origin => 'Castries', :destination => 'Soufriere', :path => 'B'}]
trips = [
        {:route_id => 1, :driver_id => 1, :van_id => 1, :departure => 'Date.today'},
        {:route_id => 2, :driver_id => 2, :van_id => 2, :departure => 'Date.tomorrow'}]
vans = [
        {:designation => 'big blue bus', :capacity => 15},
        {:designation => 'big red bus', :capacity => 15}]
