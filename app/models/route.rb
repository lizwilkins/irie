class Route < ActiveRecord::Base

  validates :number, :origin, :destination, :path, :presence => true
  attr_accessible :number, :origin, :destination, :path
  validates_uniqueness_of :number

  has_many :trips

end
