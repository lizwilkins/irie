require 'spec_helper'

describe Rider do
  context 'validations' do
    it {should validate_presence_of :user_id}
    it {should validate_presence_of :balance}

    it {should validate_uniqueness_of :user_id}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :user_id}
    it {should allow_mass_assignment_of :balance}
  end	

  context 'associations' do
    it {should have_many :trips}
    it {should have_many :passengers}
    it {should belong_to :user}
  end    
end