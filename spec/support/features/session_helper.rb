def admin_login_helper
  admin = FactoryGirl.create(:admin)
  visit root_path
  click_link 'Log In'
  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password
  click_button 'Submit'
end

def login_as_user_as_rider
  user_as_rider = FactoryGirl.create(:user_as_rider)
  visit root_path
  click_link 'Log In'
  fill_in 'Username', with: user_as_rider.username
  fill_in 'Password', with: user_as_rider.password
  click_button 'Submit'
  user_as_rider
end