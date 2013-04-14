class Driver < ActiveRecord::Base

  validates :user_id, :supervisor, :presence => true
  attr_accessible :user_id, :supervisor
  validates_uniqueness_of :user_id

  has_many :trips
  belongs_to :user

end
