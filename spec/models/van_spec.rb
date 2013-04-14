require 'spec_helper'

describe Van do
 context 'validations' do
    it {should validate_presence_of :designation}
    it {should validate_presence_of :capacity}

    it {should validate_uniqueness_of :designation}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :designation}
    it {should allow_mass_assignment_of :capacity}
  end

  context 'associations' do
    it {should have_many :trips}
  end      
end