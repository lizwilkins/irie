require 'spec_helper'

describe Route do
  context 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :origin}
    it {should validate_presence_of :destination}
  end
end