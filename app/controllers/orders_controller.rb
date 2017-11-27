class OrdersController < ApplicationController

  def index
   render json: @delivery_orders
  end
end
