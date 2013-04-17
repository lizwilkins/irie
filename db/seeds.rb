# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!({:role => 'admin', :username => "admin", :first_name => "admin", :last_name => "admin", :email => "admin@gmail.com", :password => "admin", :password_confirmation => "admin"})

(2..5).each do |i|
  User.create!({:username => "user#{i}", :first_name => "user#{i}", :last_name => "user#{i}", :email => "user#{i}@gmail.com", :password => "user#{i}", :password_confirmation => "user#{i}"})
end

(6..10).each do |i|
  User.create!({:role => 'supervisor', :username => "super#{i}", :first_name => "super#{i}", :last_name => "super#{i}", :email => "super#{i}@gmail.com", :password => "super#{i}", :password_confirmation => "super#{i}"})
end

(11..15).each do |i|
  User.create!({:role => 'agent', :username => "agent#{i}", :first_name => "agent#{i}", :last_name => "agent#{i}", :email => "agent#{i}@gmail.com", :password => "agent#{i}", :password_confirmation => "agent#{i}"})
end

(1..15).each do |i|
  Rider.create!({:user_id => i, :balance => '100.00'})
end

(6..10).each do |i|
  Driver.create!( 
  {:user_id => i, :supervisor => "super#{i}"})
end

(1..5).each do |i|
  Bus.create!({:license_number => "bus#{i}", :capacity => 15, :description => 'bright red polkadots'})

end

(1..5).each do |i|
  Route.create!(
  {:number => "route#{i}", :origin => 'Castries', :destination => 'Soufriere', :path => 'local'})
end

Trip.create!({:route_id => 1, :driver_id => 5, :bus_id => 3, :departure => DateTime.now})
Trip.create!({:route_id => 1, :driver_id => 4, :bus_id => 3, :departure => DateTime.now})
Trip.create!({:route_id => 2, :driver_id => 4, :bus_id => 1, :departure => DateTime.now})
Trip.create!({:route_id => 3, :driver_id => 3, :bus_id => 2, :departure => DateTime.now})
Trip.create!({:route_id => 3, :driver_id => 2, :bus_id => 4, :departure => DateTime.now})
Trip.create!({:route_id => 4, :driver_id => 2, :bus_id => 5, :departure => DateTime.now})
Trip.create!({:route_id => 5, :driver_id => 1, :bus_id => 5, :departure => DateTime.now})

Passenger.create!({:trip_id => 1, :rider_id => 7})
Passenger.create!({:trip_id => 1, :rider_id => 8})
Passenger.create!({:trip_id => 1, :rider_id => 9})
Passenger.create!({:trip_id => 1, :rider_id => 10})
Passenger.create!({:trip_id => 2, :rider_id => 11})
Passenger.create!({:trip_id => 2, :rider_id => 12})
Passenger.create!({:trip_id => 2, :rider_id => 13})
Passenger.create!({:trip_id => 2, :rider_id => 14})
Passenger.create!({:trip_id => 2, :rider_id => 15})

# users = User.create([
#   {email: 'a@b.c', jam_name: '111', password: 'abc123', password_confirmation: 'abc123'},
#   {email: 'b@c.d', jam_name: '222', password: 'abc123', password_confirmation: 'abc123'},
#   {email: 'd@e.f', jam_name: '333', password: 'abc123', password_confirmation: 'abc123'},
#   {email: 'e@f.g', jam_name: '444', password: 'abc123', password_confirmation: 'abc123'}])

# songs = [
#   {title: '111', description: 'abc123'},
#   {title: '222', description: 'abc123'},
#   {title: '333', description: 'abc123'},
#   {title: '444', description: 'abc123'}]

# real_songs = []
# users.each_with_index do |user, i|
#   song = user.songs.create(songs[i])
#   song.contributions.first.update_attribute(:owner, true)
#   real_songs << song
# end

# tracks = [
#   {title: 'aaa111', description: 'aaa123'},
#   {title: 'bbb222', description: 'bbb123'},
#   {title: 'ccc333', description: 'ccc123'},
#   {title: 'ddd444', description: 'ddd123'}]

# real_songs.each_with_index do |song, i|
#   track = song.tracks.create(tracks[i])
# end
