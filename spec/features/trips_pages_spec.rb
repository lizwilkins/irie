require 'spec_helper'

feature 'Trips' do 
  scenario 'trips by route #' do
    admin_login_helper
    trip = FactoryGirl.create(:trip)
    visit trips_path
    page.should have_content trip.departure
  end

  scenario 'a rider adds themself to trip' do
    user = login_as_user_as_rider
    trip = FactoryGirl.create(:trip)
    visit routes_path
    click_link trip.route.number
    click_button 'Add Me'
    page.should have_content "has been added to the passenger list."
  end
end