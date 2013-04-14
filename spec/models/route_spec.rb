require 'spec_helper'

describe Route do
  context 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :origin}
    it {should validate_presence_of :destination}
    it {should validate_presence_of :path}

    it {should validate_uniqueness_of :number}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :number}
    it {should allow_mass_assignment_of :origin}
    it {should allow_mass_assignment_of :destination}
    it {should allow_mass_assignment_of :path}
  end

  context 'associations' do
    it {should have_many :trips}
  end   
end