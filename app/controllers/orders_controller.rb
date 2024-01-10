class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :process_ord]
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
  end

  def process_ord
    Order.process_order(@order)
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:price, :quantity, :user_id, :status, :order_type)
  end

end
