class MeasurementItemsController < ApplicationController
  before_action :set_measurement_item, only: [ :show, :edit, :update, :destroy ]

  def index
    @measurement_items = MeasurementItem.all
  end

  def show
  end

  def new
    @measurement_item = MeasurementItem.new
  end

  def create
    @measurement_item = MeasurementItem.new(measurement_item_params)

    if @measurement_item.save
      redirect_to measurement_items_path, notice: "計測項目を作成しました"
    else
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:plant_id])
    @measurement = Measurement.find(params[:id])
  end

  def update
    if @measurement_item.update(measurement_item_params)
      redirect_to measurement_items_path, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @measurement_item.destroy
    redirect_to measurement_items_path, notice: "削除しました"
  end

  private
  def set_measurement_item
    @measurement_item = MeasurementItem.find(params[:id])
  end

  def measurement_item_params
    params.require(:measurement_item).permit(
      :name,        # 例：施設内温度
      :unit,        # 例：℃
      :min_target, # 目標下限
      :max_target  # 目標上限
    )
  end
end
