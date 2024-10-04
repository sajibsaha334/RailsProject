class OrdersController < ApplicationController
  def order
    if @current_cart.line_items.size < 1
      return
    end
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
      @orders = Order.order(id: :desc)
    else
      @orders = current_user.orders.order(id: :desc)
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

  def mark_undelivered
    @order = Order.find(params[:order_id])
    @order.pending!

    redirect_to orders_path
  end
end
