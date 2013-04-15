class User < ActiveRecord::Base

  ROLES = %w[admin agent supervisor driver]  

  has_secure_password

  validates :username, :password, :password_confirmation, :email, :presence => true
  attr_accessible :username, :password, :password_confirmation, :email, :first_name, :last_name, :phone, :role
  validates_uniqueness_of :email, :username

  has_one :rider
  has_one :driver
end
