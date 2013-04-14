class VansController < ApplicationController
  def new
    @van = Van.new
  end
  
  # def create
  #   @van = van.new(params[:van])
  #   if @van.save
  #     session[:van_id] = @van.id
  #     redirect_to root_url, notice: "Thank you for signing up!"
  #   else
  #     flash.now[:alert] = "There were errors"
  #     render :new
  #   end
  # end

  def index
    @vans = Van.all
    render :index
  end

  # def edit
  #   @van = van.find(params[:id])
  # end

  # def update
  #   @van = van.find(params[:id])
  #   if @van.update_attributes(params[:van])
  #     flash[:notice] = "Your account was successsfully updated."
  #     redirect_to vans_path
  #   else
  #     flash.now[:alert] = "There were errors in trying to update your account!"
  #     render :edit
  #   end
  # end

  # def destroy
  #   @van = van.find(params[:id])
  #   @van.destroy
  #   flash[:notice] = "Your profile has been obliterated!"
  #   redirect_to signup_path
  # end
end