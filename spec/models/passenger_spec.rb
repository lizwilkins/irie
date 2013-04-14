require 'spec_helper'

describe Passenger do
  context 'validations' do
    it {should validate_presence_of :rider_id}
    it {should validate_presence_of :trip_id}
  end

  context 'accessibility' do 
    it {should validate_presence_of :rider_id}
    it {should validate_presence_of :trip_id}
  end	

  context 'associations' do
    it {should belong_to :trip}
    it {should belong_to :rider}
  end        
end
