class OrdersController < ApplicationController
  def order
    order = Order.create
    order.user = current_user
    @current_cart.line_items.each do |line_item|
      order.line_items << line_item
    end
    order.save
    new_cart = Cart.create(user: current_user)
    session[:cart_id] = nil

    redirect_to success_path
  end

  def success
  end

  def index
    if current_user.try(:type)
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def mark_delivered
    @order = Order.find(params[:order_id])
    @order.delivered!

    redirect_to orders_path
  end
end
