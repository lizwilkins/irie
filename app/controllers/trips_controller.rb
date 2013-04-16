class TripsController < ApplicationController
  
  load_and_authorize_resource

  def new
    @trip = Trip.new
  end
  
  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      session[:trip_id] = @trip.id
      redirect_to trips_path, notice: "The trip was successfully created."
    else
      flash.now[:alert] = "There were errors creating your trip."
      render :new
    end
  end

  def index
    @trips = Trip.paginate(:page => params[:page], :per_page => 10)  #default is 30, remove '.per_page(5)' for default
  end

  def show
    @trip = Trip.find(params[:id])
  end  

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip])
      flash[:notice] = "The trip was successfully updated."
      redirect_to trips_path
    else
      flash.now[:alert] = "There were errors updating your trip."
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "The trip was successfully deleted."
    redirect_to trips_path
  end
end