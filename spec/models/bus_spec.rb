require 'spec_helper'

describe Bus do

 context 'validations' do
    it {should validate_presence_of :license_number}
    it {should validate_presence_of :capacity}
    it {should validate_presence_of :description}

    it {should validate_uniqueness_of :license_number}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :license_number}
    it {should allow_mass_assignment_of :capacity}
    it {should validate_presence_of :description}
  end

  context 'associations' do
    it {should have_many :trips}
  end      
end