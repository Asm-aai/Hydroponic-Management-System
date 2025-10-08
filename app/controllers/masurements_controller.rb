class MasurementsController < ApplicationController
  def new
    @masurement = Masurement.new
    @plant = Plant.find(params[:plant_id])
  end

  def index
    @masurements = Masurement.all
  end

  def show
    @masurement = Masurement.find(params[:id])
    @plant = Plant.find(params[:plant_id])
  end

  def edit
    @masurement = Masurement.find(params[:id])
    @plant = Plant.find(params[:plant_id])
  end
end
