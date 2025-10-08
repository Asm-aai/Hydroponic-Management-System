class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to plants_path
    else
      @plants = Plant.all   # ← ここを追加！
      render :index, status: :unprocessable_entity
    end
  end

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def edit
    @plant = Plant.find(params[:id])
    @plant.update
  end

  def destroy
    plant = Plant.find(params[:id])
    plant.destroy
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :planted_at, :harvested_at, :comment)
  end
end
