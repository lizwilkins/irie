def route_creation_helper
  visit routes_path
  click_link 'Create route'
  fill_in 'Number', :with => '6B'
  fill_in 'Origin', :with => 'Laborie'
  fill_in 'Destination', :with => 'Canaries'
  click_button 'Submit'
end