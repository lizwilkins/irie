class DriversController < ApplicationController
  before_filter :admin_required, :only => [:destroy, :edit]

  load_and_authorize_resource

  def new
    @driver = Driver.new
  end
  
  def create
    @driver = Driver.new(params[:driver])
    if @driver.save
      redirect_to drivers_path, notice: "The driver profile was successfully created."
    else
      flash.now[:alert] = "TThere were errors creating the driver profile."
      render :new
    end
  end

  def index
    @drivers = Driver.all
      render :index
    end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update_attributes(params[:driver])
      flash[:notice] = "The driver profile was successfully updated."
      redirect_to drivers_path
    else
      flash.now[:alert] = "There were errors updating the driver profile."
      render :edit
    end
  end

  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy
    flash[:notice] = "The driver was successfully deleted."
    redirect_to drivers_path
  end
end