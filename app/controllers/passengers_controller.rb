class PassengersController < ApplicationController
  def new
    trip = Trip.find(params[:trip_id])
    @passenger = trip.passengers.new(:rider_id => current_user.rider.id)
  end
  
  def create
    # @trip = Trip.find(params[:id])
    @passenger = Passenger.new(params[:passenger])
    if @passenger.save
      redirect_to passengers_path, notice: 'Passenger "params[:passenger][:rider_id]" has been added to the passenger list.'
    else
      flash.now[:alert] = "There were errors adding this passenger."
      render :new
    end
  end

  def index
    @passengers = Passenger.all
      render :index
    end

  def destroy
    @passenger = Passenger.find(params[:id])
    # trip = Trip.find(@passenger.trip_id)
    @passenger.try(:destroy)
    flash[:notice] = "This passenger was deleted from the passenger list."
    redirect_to passengers_path
    # redirect_to trip_path(trip)
  end
end