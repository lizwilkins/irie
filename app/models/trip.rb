class Trip < ActiveRecord::Base

  validates :driver_id, :bus_id, :route_id, :departure, :presence => true
  attr_accessible :driver_id, :bus_id, :route_id, :departure

  belongs_to :bus
  belongs_to :route
  belongs_to :driver

  has_many :passengers
  has_many :riders, :through => :passengers

end
