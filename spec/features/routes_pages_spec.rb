require 'spec_helper'

feature 'Routes' do
  scenario 'Create a new route' do
    visit routes_path
    click_link 'Create route'
    fill_in 'Number', :with => '1A'
    fill_in 'Origin', :with => 'Castries'
    fill_in 'Destination', :with => 'Gros Islet'
    click_button 'Submit'
    page.should have_content '1A'
  end

  scenario 'creating a new route with invalid input' do
    visit routes_path
    click_link 'Create route'
    click_button 'Submit'
    page.should have_content 'error'
  end

  scenario 'editing an existing route' do
    FactoryGirl.create(:route)
    visit routes_path
    click_link 'Edit'
    fill_in 'Number', :with => '1B'
    fill_in 'Origin', :with => 'Choc'
    fill_in 'Destination', :with => 'Babonneau'
    fill_in 'Path', :with => 'local'
    click_button 'Submit'
    page.should have_content '1B'
  end

  scenario 'updating a route with invalid input' do
    FactoryGirl.create(:route)
    visit routes_path
    click_link 'Edit'
    fill_in 'Number', :with => ''
    click_button 'Submit'
    page.should have_content 'error'
  end

  scenario 'deleting a route' do
    route = FactoryGirl.create(:route)
    visit routes_path
    click_link 'Delete'
    page.should have_content 'deleted'
  end
end