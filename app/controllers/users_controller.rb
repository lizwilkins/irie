class UsersController < ApplicationController

  before_filter :authorize, :except => [:new, :create, :index]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Your account was successsfully created."
    else
      flash.now[:alert] = "There were errors creating your account."
      render :new
    end
  end

  def index
    @users = User.all
      render :index
    end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your account was successsfully updated."
      redirect_to users_path
    else
      flash.now[:alert] = "There were errors updating your account."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.try(:destroy)
    session[:user_id] = nil
    flash[:notice] = "Your account was successsfully deleted."
    redirect_to root_path
  end
end