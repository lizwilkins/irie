require 'spec_helper'

feature 'Trips' do 
  let(:user) {FactoryGirl.create(:admin)}
  scenario 'trips by route #' do
    visit trips_path
    click_link 'Add Me'
    fill_in 'x', :with => ''


  end
end