require 'spec_helper'

describe Driver do
  context 'validations' do
    it {should validate_presence_of :user_id}
    it {should validate_presence_of :supervisor}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :user_id}
    it {should allow_mass_assignment_of :supervisor}
  end	

  context 'associations' do
    it {should have_many :trips}
    it {should belong_to :user}
  end  
end