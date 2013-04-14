class User < ActiveRecord::Base
<<<<<<< HEAD
  easy_roles :roles
end

# @user = User.first

# @user.add_role 'admin'

# @user.is_admin?
# => true

# @user.has_role? 'admin'
# => true

# @user.is_awesome?
# => false

# @user.add_role 'awesome'

# @user.is_awesome?
# => true

# @user.remove_role 'admin'

# @user.is_admin?
# => false

# scope
# @admins = User.with_role('admin')  
=======
  has_secure_password

  validates :username, :password, :password_confirmation, :email, :presence => true
  attr_accessible :username, :password, :password_confirmation, :email, :first_name, :last_name, :phone
  validates_uniqueness_of :email, :username
end
>>>>>>> master
