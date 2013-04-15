require 'spec_helper'

describe User do

  context 'validations' do
    it {should validate_presence_of :username}
    it {should validate_presence_of :password}
    it {should validate_presence_of :password_confirmation}
    it {should validate_presence_of :email}

    it {should validate_uniqueness_of :username}
    it {should validate_uniqueness_of :email}
  end

  context 'password security' do
    it 'validates strength of a password'
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :username}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :first_name}
    it {should allow_mass_assignment_of :last_name}
    it {should allow_mass_assignment_of :phone}   
  end

  context 'associations' do
    it {should have_one :rider}
    it {should have_one :driver}
  end

  context 'sets role' do
    it "sets a user's role to 'Admin'"
  end

  context "checks role" do
    it "checks that a user's role is 'Admin'"
  end


end