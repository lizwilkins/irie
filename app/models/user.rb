class User < ActiveRecord::Base

  has_secure_password

  validates :username, :password, :password_confirmation, :email, :presence => true
  attr_accessible :username, :password, :password_confirmation, :email, :first_name, :last_name, :phone
  validates_uniqueness_of :email, :username
end
