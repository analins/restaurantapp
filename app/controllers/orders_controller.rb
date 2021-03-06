class OrdersController < ApplicationController

  def index
    @orders = Order.where({is_complete: false})
  end

  def new
    @order = Order.new
  end

  def create
    Order.create(order_params)
    redirect_to :back
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to orders_path
  end

  def destroy
    Order.delete(params[:id])
    redirect_to :back
  end

  private

  def order_params
    params.require(:order).permit(:food_item_id, :party_id, :is_complete, :notes)
  end

end
