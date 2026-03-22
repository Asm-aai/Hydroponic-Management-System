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
    @measurement = Measurement.new
    @measurements = @plant.measurements.includes(:measurement_items, :measurement_values)
    @measurement = Measurement.new(measured_at: Date.current)
    MeasurementItem.all.each do |item|
      @measurement.measurement_values.build(measurement_item: item)
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      redirect_to plant_path(@plant), notice: "更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_path, notice: "削除しました。"
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :planted_at, :harvested_at, :comment)
  end
end
