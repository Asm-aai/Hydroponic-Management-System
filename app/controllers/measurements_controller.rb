class MeasurementsController < ApplicationController
  before_action :set_plant

  def new
    @masurement = Masurement.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    # @masurement = Masurement.new(measurement_params)
    @measurement = @plant.measurements.build(measurement_params)
    if @measurement.save
      redirect_to plant_path(@plant), notice: "計測値を登録しました。"
    else
      @measurements = @plant.measurements
      render "plants/show", status: :unprocessable_entity
    end
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

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def measurement_params
    params.require(:measurement).permit(:measurement_type, :value, :measured_at)
  end
end
