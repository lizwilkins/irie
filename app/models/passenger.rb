class Passenger < ActiveRecord::Base

  validates :trip_id, :rider_id, :presence => true
  attr_accessible :trip_id, :rider_id

  belongs_to :trip
  belongs_to :rider

end
