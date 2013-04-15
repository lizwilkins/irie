require 'spec_helper'

feature 'Trips' do 
  scenario 'trips by route #' do
    visit trips_path
    click_link 'add me'
    fill_in 'x', :with => ''


  end
end