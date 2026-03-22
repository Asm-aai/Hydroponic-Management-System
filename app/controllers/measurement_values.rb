class MeasurementValuesController < ApplicationController
  before_action :set_measurement

  def create
    @measurement_value = @measurement.measurement_values.new(measurement_value_params)
    if @measurement_value.save
      redirect_to plant_path(@measurement.plant), notice: "計測値を登録しました"
    else
      redirect_to plant_path(@measurement.plant), alert: "登録に失敗しました"
    end
  end

  def edit
    @plant = Plant.find(params[:plant_id])
    @measurement = Measurement.find(params[:measurement_id])
    @value = MeasurementValue.find(params[:id])
  end

  def update
    @measurement_value = MeasurementValue.find(params[:id])
    if @measurement_value.update(measurement_value_params)
      redirect_to plant_path(@measurement_value.measurement.plant), notice: "更新しました"
    else
      redirect_to plant_path(@measurement_value.measurement.plant), alert: "更新失敗"
    end
  end

  def destroy
    @measurement_value = MeasurementValue.find(params[:id])
    plant = @measurement_value.measurement.plant
    @measurement_value.destroy
    redirect_to plant_path(plant), notice: "削除しました"
  end

  private
  def set_measurement
    @measurement = Measurement.find(params[:measurement_id])
  end

  def measurement_value_params
    params.require(:measurement_value).permit(
      :measurement_item_id, # 温度なのか湿度なのか
      :value                # 実際の数値
    )
  end
end
