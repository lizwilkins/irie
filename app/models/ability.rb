class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new     # guest user (not logged in) or rider user
    case 
    when user.role == 'admin'
      can :manage, :all
    when user.role == 'agent'
      can [:show, :update, :destroy], User, :user => @current_user

      can [:create, :read, :destroy], Passenger
      can [:create, :read, :update, :destroy], User, :user => @current_user 
    when user.role == 'supervisor'
      can [:create], User
      can [:show, :update, :destroy], User, :user => @current_user

      can [:create, :read, :update, :destroy], Driver
      can [:read], Trip
      can [:update], Trip   #driver only
    when user.role == 'driver'
      can [:show, :update, :destroy], User, :user => @current_user

      can [:read], Driver     
      can [:update], Driver     # contact info only
    else  # guest user (not logged in) or rider user
      can [:create], User
      can [:show, :update, :destroy], User, :user => @current_user

      can [:read], Route
      can [:read], Trip
      can [:create], Passenger
      can [:show, :destroy], Passenger  #, :rider_id => current_user.rider.id

      can [:create, :show, :update, :destroy], Rider #, :user_id => @current_user.id
    end 
  end
end