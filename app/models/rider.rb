class Rider < ActiveRecord::Base

  validates :user_id, :balance, :presence => true
  attr_accessible :user_id, :balance
  validates_uniqueness_of :user_id

  belongs_to :user

  has_many :passengers
  has_many :trips, :through => :passengers
end
