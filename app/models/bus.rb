class Bus < ActiveRecord::Base

  validates :license_number, :capacity, :description, :presence => true
  attr_accessible :license_number, :capacity, :description
  validates_uniqueness_of :license_number

  has_many :trips
end