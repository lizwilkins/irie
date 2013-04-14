class RidersController < ApplicationController
  def new
    @rider = Rider.new
  end
  
  def create
    @rider = Rider.new(params[:rider])
    if @rider.save
      redirect_to rider_path(@rider), notice: "Your profile was successfully created."
    else
      flash.now[:alert] = "There were errors creating your profile."
      render :new
    end
  end

  def index
    @riders = Rider.all
      render :index
    end

  def edit
    @rider = Rider.find(params[:id])
  end

  def update
    @rider = Rider.find(params[:id])
    if @rider.update_attributes(params[:rider])
      flash[:notice] = "Your profile was successsfully updated."
      redirect_to rider_path(@rider)
    else
      flash.now[:alert] = "There were errors updating your profile."
      render :edit
    end
  end

  def destroy
    @rider = Rider.find(params[:id])
    @rider.destroy
    flash[:notice] = "Your profile was successfully deleted."
    redirect_to root_path
  end
end