class UsersController < ApplicationController

  load_and_authorize_resource

  def new
    # skip_authorization_check
    @user = User.new
  end
  
  def create
    # skip_authorization_check
    @user = User.new(params[:user])
    if @user.save
      @user.create_rider(:balance => 0.00)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Your account was successfully created."
    else
      flash.now[:alert] = "There were errors creating your account."
      render :new
    end
  end

  def index
    @users = User.all
    end

  def edit
    # @user = current_user
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your account was successfully updated."
      redirect_to users_path
    else
      flash.now[:alert] = "There were errors updating your account."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.try(:destroy)
    if current_user.role != 'admin'
      session[:user_id] = nil
    end
    flash[:notice] = "The user was successfully deleted."
    redirect_to users_path
#     p current_user
# p @user
#     if @user.destroy
#       session[:user_id] = nil  #not for admin???
#       flash[:notice] = "The user was successfully deleted."
# puts "The user was successfully deleted."
#     render :index
#     # redirect_to users_path
#     else
#       flash[:notice] = "There were errors deleting the your account."
# puts "There were errors deleting the your account."
#     redirect_to users_path
#     end
  end
end