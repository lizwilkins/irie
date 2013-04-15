class BusesController < ApplicationController

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(params[:bus])
    if @bus.save
      redirect_to buses_path, notice: "The bus was successsfully created."
    else
      flash.now[:alert] = "There were errors creating the bus."
      render :new
    end
  end

  def index
    @buses = Bus.all
    render :index
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def destroy
    @bus = Bus.find(params[:id])
    @bus.destroy
    flash[:notice] = "The bus was successfully deleted."
    redirect_to buses_path
  end  
end


 # def new
 #    @bus = Bus.new
 #  end
  
  # def create
  #   @bus = Bus.new(params[:bus])
  #   if @bus.save
  #     session[:bus_id] = @bus.id
  #     redirect_to root_url, notice: "The bus was successfully created."
  #   else
  #     flash.now[:alert] = "There were errors creating the bus."
  #     render :new
  #   end
  # end

  # def index
  #   @buss = Bus.all
  #   render :index
  # end

  # def edit
  #   @bus = Bus.find(params[:id])
  # end

  # def update
  #   @bus = Bus.find(params[:id])
  #   if @bus.update_attributes(params[:bus])
  #     flash[:notice] = "The bus was successsfully updated."
  #     redirect_to buss_path
  #   else
  #     flash.now[:alert] = "There were errors deleting the bus."
  #     render :edit
  #   end
  # end

