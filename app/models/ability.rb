class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new     # guest user (not logged in) or rider user
    case 
    when user.role == 'admin'
      can :manage, :all
    when user.role == 'agent'
      can [:create, :read, :destroy], Passenger
      can [:create, :read, :update, :destroy], User, :user => @current_user 
    when user.role == 'supervisor'
      can [:create, :read, :update, :destroy], Driver
      can [:read], Trip
      can [:update], Trip   #driver only
      can [:create, :read, :update, :destroy], User, :user => @current_user
    when user.role == 'driver'
      can [:read], Driver     
      can [:update], Driver     # contact info only
      can [:create, :read, :update, :destroy], User, :user => @current_user
    else  # guest user (not logged in) or rider user
      can :index, Route  # plus :departures
      can [:create, :read, :destroy], Passenger  #, :rider_id => current_user.rider.id
      can [:crud], Rider  #, :user_id => current_user.id
      can [:read, :update, :destroy], User, :user => @current_user
      can [:create], User 
    end 
  end
end