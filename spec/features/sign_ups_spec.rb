require 'spec_helper'
feature 'Sign up' do
  let(:user) {FactoryGirl.build(:user)}
  scenario "creates a user and logs him/her in" do
    visit root_path
    click_link "Sign Up"
    fill_in "user_username", :with => user.username
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    fill_in "user_first_name", :with => user.first_name
    fill_in "user_last_name", :with => user.last_name
    fill_in "user_phone", :with => user.phone
    click_button "Sign Up"
    page.should have_content 'Your account was successsfully created.'
  end
end

feature 'invalid sign up' do 
  scenario "won't sign up a user with out the email address" do
    user = User.new
    visit root_path
    click_link "Sign Up"
    fill_in "user_username", :with => user.username
    fill_in "user_email", :with => ""
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    fill_in "user_first_name", :with => user.first_name
    fill_in "user_last_name", :with => user.last_name
    fill_in "user_phone", :with => user.phone
    click_button "Sign Up"
    page.should have_content "Form is invalid"
  end
end


feature 'Log In' do
  let(:user) {FactoryGirl.create(:user)}
  scenario "Signs in a user" do
    visit root_path
    click_link "Log In"
    fill_in "username", :with => user.username
    fill_in "password", :with => user.password
    click_button "Submit"
    page.should have_content 'Logged in as'
  end
end

feature 'Log Out' do 
  let(:user) {FactoryGirl.create(:user)}
  scenario "Logs a user out" do 
    visit root_path
    click_link "Log In"
    fill_in "username", :with => user.username
    fill_in "password", :with => user.password
    click_button "Submit"
    click_link "Log Out" 
    page.should have_content "Logged out."   
  end
end
