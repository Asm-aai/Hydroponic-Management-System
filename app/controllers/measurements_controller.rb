class MeasurementsController < ApplicationController
  before_action :set_plant, except: [:all]

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

  def edit
    @measurement = Measurement.find(params[:id])
    @plant = Plant.find(params[:plant_id])
  end

  def update
    @measurement = Measurement.find(params[:id])
    @plant = Plant.find(params[:plant_id])
    if @measurement.update(measurement_params)
      redirect_to plant_path(@plant), notice: "計測値を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @measurement = Measurement.find(params[:id])
    @measurement.destroy
    redirect_to plant_path, notice: "削除しました。"
  end

  def all
    @plants = Plant.all
    @measurements = Measurement.all
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def measurement_params
    params.require(:measurement).permit(:measurement_type, :value, :measured_at)
  end
end
