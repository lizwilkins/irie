require 'spec_helper'

feature 'Trips' do 
  scenario 'trips by route #' do
    admin_login_helper
    FactoryGirl.create(:trip)
    visit trips_path
    # click_button 'Add Me'

  end
end