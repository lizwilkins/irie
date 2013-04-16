require 'spec_helper'

feature 'buses' do
  let(:user) {FactoryGirl.create(:admin)}
  scenario 'create a new bus' do
    admin_login_helper
    visit buses_path
    click_link 'Create Bus'
    fill_in 'License number', :with => '1A'
    select(66, :from => 'Capacity')
    fill_in 'Description', :with => 'pink and orange flames'
    click_button 'Submit'
    page.should have_content '1A'
   end
end