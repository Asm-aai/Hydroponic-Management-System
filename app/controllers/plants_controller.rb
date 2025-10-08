class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def create
    plant = Plant.new(plant_params)
    plant.save
    # redirect_to plant_path(@plant.id)
    render :index
  end

  def index
    @plamnts = Plant.all
  end

  def show
    @plamnt = Plant.find(params[:id])
  end

  def edit
    @plamnt = Plant.find(params[:id])
    @plamnt.update
  end

  def destroy
    @plamnt = Plant.find(params[:id])
    @plamnt.destroy
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :planted_at, :harvested_at, :comment)
  end
end
