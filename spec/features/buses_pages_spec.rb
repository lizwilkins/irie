require 'spec_helper'

feature 'buses' do
  scenario 'create a new bus' do
    visit buses_path
    click_link 'Create bus'
    fill_in 'License number', :with => '1A'
    select(66, :from => 'Capacity')
    fill_in 'Description', :with => 'pink and orange flames'
    click_button 'Submit'
   end
end