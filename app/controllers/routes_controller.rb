class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(params[:route])
    if @route.save
      flash[:notice] = "Route #{@route.number} created!"
      redirect_to routes_path
    else
      render :new
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    if @route.update_attributes(params[:route])
      flash[:notice] = "Route #{@route.number} updated!"
      redirect_to routes_path
    else
      render :edit
    end
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    flash[:notice] = "Route #{@route.number} deleted!"
    redirect_to routes_path
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 2ff74cd34f00fd6826d8d9ea56683ba6717bdfc7
