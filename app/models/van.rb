class Van < ActiveRecord::Base

  validates :designation, :capacity, :presence => true
  attr_accessible :designation, :capacity
  validates_uniqueness_of :designation

  has_many :trips
end
