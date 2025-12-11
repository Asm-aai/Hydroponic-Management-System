# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    @cart = current_user.cart
    if @cart.cart_items.empty?
      redirect_to cart_path, alert: "カートが空です。"
    end
  end

  def create
    cart = current_user.cart

    order = current_user.orders.create!(
      total_price: calculate_total(cart),
      status: 0
    )

    cart.cart_items.each do |item|
      order.order_items.create!(
        plant_id: item.plant_id,
        quantity: item.quantity,
        price: item.plant.price
      )
    end

    cart.cart_items.destroy_all

    redirect_to order_path(order), notice: "注文が完了しました。"
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  private

  def calculate_total(cart)
    cart.cart_items.sum { |item| item.plant.price * item.quantity }
  end
end