class MeasurementItemsController < ApplicationController
  before_action :set_measurement_item, only: [ :show, :edit, :update, :destroy ]

  # 一覧表示
  def index
    @measurement_items = MeasurementItem.all
  end

  # 詳細表示
  def show
  end

  # 新規作成画面
  def new
    @measurement_item = MeasurementItem.new
  end

  # 登録処理
  def create
    @measurement_item = MeasurementItem.new(measurement_item_params)

    if @measurement_item.save
      redirect_to measurement_items_path, notice: "計測項目を作成しました"
    else
      render :new
    end
  end

  # 編集画面
  def edit
  end

  # 更新処理
  def update
    if @measurement_item.update(measurement_item_params)
      redirect_to measurement_items_path, notice: "更新しました"
    else
      render :edit
    end
  end

  # 削除処理
  def destroy
    @measurement_item.destroy
    redirect_to measurement_items_path, notice: "削除しました"
  end

  private

  # URLの:idから対象を取得
  def set_measurement_item
    @measurement_item = MeasurementItem.find(params[:id])
  end

  # ストロングパラメータ
  def measurement_item_params
    params.require(:measurement_item).permit(
      :name,        # 例：施設内温度
      :unit,        # 例：℃
      :min_target, # 目標下限
      :max_target  # 目標上限
    )
  end
end
