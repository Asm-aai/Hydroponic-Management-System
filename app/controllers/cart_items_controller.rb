class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def create
    plant = Plant.find(params[:plant_id])
    item = @cart.cart_items.find_or_initialize_by(plant_id: plant.id)
    item.quantity = item.quantity.to_i + params[:quantity].to_i

    item.save
    redirect_to cart_path, notice: "カートに追加しました"
  end

  def update
    item = @cart.cart_items.find(params[:id])
    item.update(quantity: params[:quantity])
    redirect_to cart_path, notice: "数量を更新しました"
  end

  def destroy
    item = @cart.cart_items.find(params[:id])
    item.destroy
    redirect_to cart_path, notice: "削除しました"
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end
