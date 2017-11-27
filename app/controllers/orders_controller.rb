class OrdersController < ApplicationController

  def index
    @delivery_orders = DeliveryOrder.all
   render json: @delivery_orders
  end
end
