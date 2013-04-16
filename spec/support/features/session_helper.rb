def admin_login_helper
  admin = FactoryGirl.create(:admin)
  visit root_path
  click_link 'Log In'
  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password
  click_button 'Submit'
end