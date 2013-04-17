require 'spec_helper'

feature 'Users' do 
  scenario 'list all users' do
    admin_login_helper
    user = FactoryGirl.create(:user)
    visit users_path
    page.should have_content user.first_name
  end

  # scenario 'add passenger to trip' do
  #   admin_login_helper
  #   FactoryGirl.create(:trip)
  #   FactoryGirl.create(:rider)
  #   visit trips_path
  #   click_button 'Add Me'
  #   fill_in 'passenger_trip_id', :with => '2'
  #   fill_in 'passenger_rider_id', :with => '2'
  #   page.should have_content "Passenger 2 has been added to the passenger list."
  # end
end