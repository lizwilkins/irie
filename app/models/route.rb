class Route < ActiveRecord::Base
  validates :number, :presence => :true, :uniqueness => :true
  validates :origin, :presence => :true
  validates :destination, :presence => :true
  attr_accessible :number, :origin, :destination, :path
end