class Route < ActiveRecord::Base
  validates :number, :presence => :true
  validates :origin, :presence => :true
  validates :destination, :presence => :true
end