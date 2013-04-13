class BusesController < ApplicationController

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(params[:bus])
    @bus.save
  end

  def index
    @buses = Bus.all
  end
end