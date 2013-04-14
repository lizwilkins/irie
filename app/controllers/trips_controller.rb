class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end
  
  # def create
  #   @trip = trip.new(params[:trip])
  #   if @trip.save
  #     session[:trip_id] = @trip.id
  #     redirect_to root_url, notice: "The trip was successfully created."
  #   else
  #     flash.now[:alert] = "There were errors creating your trip."
  #     render :new
  #   end
  # end

  def index
    @trips = Trip.all
      render :index
    end

  # def edit
  #   @trip = Trip.find(params[:id])
  # end

  # def update
  #   @trip = Trip.find(params[:id])
  #   if @trip.update_attributes(params[:trip])
  #     flash[:notice] = "YThe trip was successfully updated."
  #     redirect_to trips_path
  #   else
  #     flash.now[:alert] = "There were errors updating your trip."
  #     render :edit
  #   end
  # end

  # def destroy
  #   @trip = Trip.find(params[:id])
  #   @trip.destroy
  #   flash[:notice] = "The trip was successfully deleted."
  #   redirect_to signup_path
  # end
end