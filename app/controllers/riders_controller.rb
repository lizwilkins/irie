class RidersController < ApplicationController

  load_and_authorize_resource

  def new
    @rider = Rider.new
  end
  
  def create
    @rider = Rider.new(params[:rider])
    if @rider.save
      redirect_to rider_path(@rider), notice: "Your rider profile was successfully created."
    else
      flash.now[:alert] = "There were errors creating your rider profile."
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
      flash[:notice] = "Your rider profile was successfully updated."
      redirect_to rider_path(@rider)
    else
      flash.now[:alert] = "There were errors updating your rider profile."
      render :edit
    end
  end

  def destroy
    @rider = Rider.find(params[:id])
    @rider.destroy
    flash[:notice] = "Your rider profile was successfully deleted."
    redirect_to root_path
  end
end