class Trip < ActiveRecord::Base

  validates :driver_id, :van_id, :route_id, :departure, :presence => true
  attr_accessible :driver_id, :van_id, :route_id, :departure

  belongs_to :van
  belongs_to :route
  belongs_to :driver

  has_many :passengers
  has_many :riders, :through => :passengers

end
