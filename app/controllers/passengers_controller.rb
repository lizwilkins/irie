class PassengersController < ApplicationController
  before_filter :admin_required, :only => [:index]

  load_and_authorize_resource

  def new
    trip = Trip.find(params[:trip_id])
    @passenger = trip.passengers.new(:rider_id => current_user.rider.id)
  end
  
  def create
    @trip = Trip.find(params[:trip_id])
    if @passenger = @trip.passengers.create(params[:passenger])
    # if @passenger.save
      redirect_to trip_passengers_path(@trip), notice: 'Passenger "params[:passenger][:rider_id]" has been added to the passenger list.'
    else
      flash.now[:alert] = "There were errors adding this passenger."
      render :new
    end
  end

  def index
    @trip = Trip.find(params[:trip_id])
    @passengers = @trip.passengers.all
    render :index
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @passenger = @trip.passengers.find(params[:passenger][:id])
    @passenger.try(:destroy)
    flash[:notice] = "This passenger was deleted from the passenger list."
    redirect_to trip_passengers_path(@trip)
    # redirect_to trip_path(trip)
  end
end