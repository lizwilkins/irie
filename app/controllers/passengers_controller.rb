class PassengersController < ApplicationController

  load_and_authorize_resource

  def new
    if current_user.is_admin?
      render :new
    elsif current_user.rider
      trip = Trip.find(params[:trip_id])
      rider = current_user.rider
      passenger = trip.passengers.create(:rider_id => rider.id)
      flash[:notice] = 'You have been added to this trip.'
      redirect_to :back
    else
      @rider = current_user.build_rider
      render 'riders/new'
    end
  end
  
  def create
    @trip = Trip.find(params[:trip_id])
    @passenger = @trip.passengers.build(params[:passenger])
    if @passenger.save
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
    @passenger = @trip.passengers.find(params[:id])
    @passenger.try(:destroy)
    flash[:notice] = "This passenger was deleted from the passenger list."
    redirect_to trip_passengers_path(@trip)
  end
end