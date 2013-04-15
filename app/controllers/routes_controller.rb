class RoutesController < ApplicationController

  load_and_authorize_resource
  
  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(params[:route])
    if @route.save
      flash[:notice] = "Route #{@route.number} successfully created."
      redirect_to routes_path
    else
      flash.now[:alert] = "There were errors creating Route #{@route.number}."
      render :new
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    if @route.update_attributes(params[:route])
      flash[:notice] = "Route #{@route.number} successfully updated."
      redirect_to routes_path
    else
      flash.now[:alert] = "There were errors updating Route #{@route.number}."
      render :edit
    end
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    flash[:notice] = "Route #{@route.number} successfully deleted."
    redirect_to routes_path
  end
end
