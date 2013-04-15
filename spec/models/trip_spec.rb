require 'spec_helper'

describe Trip do
  context 'validations' do
    it {should validate_presence_of :route_id}
    it {should validate_presence_of :driver_id}
    it {should validate_presence_of :bus_id}
    it {should validate_presence_of :departure}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :route_id}
    it {should allow_mass_assignment_of :driver_id}
    it {should allow_mass_assignment_of :bus_id}
    it {should allow_mass_assignment_of :departure}
  end

  context 'associations' do
    it {should have_many :passengers}
    it {should have_many(:riders).through(:passengers)}
    it {should belong_to :bus}
    it {should belong_to :route}
    it {should belong_to :driver}
  end      
end