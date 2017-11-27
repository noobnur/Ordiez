class OrdersController < ApplicationController
  def index
    @delivery_orders = DeliveryOrder.all
    render json: @delivery_orders.as_json(except: [:id, :serving_datetime, :created_at, :updated_at],
         methods: [:delivery_date, :delivery_time])
  end

  def show
    @delivery = DeliveryOrder.where(order_id: params[:order_id])
    @items = OrderItem.where(delivery_order_id:@delivery.ids)

    render json: @delivery.as_json(
      except: [:id, :serving_datetime, :created_at, :updated_at],
      methods: [:delivery_date, :delivery_time],
      include: { order_items: {
        only: [:quantity],
        methods: [:name, :total_price]
        } }
      )
  end
end
