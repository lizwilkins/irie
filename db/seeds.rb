# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..20).each do |i|
  User.create({:username => "user#{i}", :email => "user#{i}@gmail.com", :password => "user#{i}", :password_confirmation => "user#{i}"})
end

(2..19).each do |i|
  Rider.create({:user_id => i, :balance => '100.00'})
end

(2..6).each do |i|
  Driver.create( 
  {:user_id => i, :supervisor => "super#{i}"})
end

(1..5).each do |i|
  Bus.create(
  {:license_number => "bus#{i}", :capacity => 15})
end

(1..5).each do |i|
  Route.create(
  {:number => "route#{i}", :origin => 'Castries', :destination => 'Soufriere', :path => 'local'})
end

Trip.create({:route_id => 1, :driver_id => 5, :bus_id => 3, :departure => DateTime.now})
Trip.create({:route_id => 1, :driver_id => 4, :bus_id => 3, :departure => DateTime.now})
Trip.create({:route_id => 2, :driver_id => 4, :bus_id => 1, :departure => DateTime.now})
Trip.create({:route_id => 3, :driver_id => 3, :bus_id => 2, :departure => DateTime.now})
Trip.create({:route_id => 3, :driver_id => 2, :bus_id => 4, :departure => DateTime.now})
Trip.create({:route_id => 4, :driver_id => 2, :bus_id => 5, :departure => DateTime.now})
Trip.create({:route_id => 5, :driver_id => 1, :bus_id => 5, :departure => DateTime.now})

Passenger.create({:trip_id => 1, :rider_id => 7})
Passenger.create({:trip_id => 1, :rider_id => 8})
Passenger.create({:trip_id => 1, :rider_id => 9})
Passenger.create({:trip_id => 1, :rider_id => 10})
Passenger.create({:trip_id => 2, :rider_id => 11})
Passenger.create({:trip_id => 2, :rider_id => 12})
Passenger.create({:trip_id => 2, :rider_id => 13})
Passenger.create({:trip_id => 2, :rider_id => 14})
Passenger.create({:trip_id => 2, :rider_id => 15})
