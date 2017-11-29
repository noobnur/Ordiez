class OrdersController < ApplicationController
  def index
    @delivery_orders = DeliveryOrder.all
    render json: @delivery_orders.as_json(except: [:serving_datetime, :created_at, :updated_at],
                                          methods: [:delivery_date, :delivery_time],
                                          include: { order_items: {
                                            methods: [:order_item_id, :name],
                                            only: [:order_item_id, :name]
                                          } })
  end

  def show
    @delivery = DeliveryOrder.where(order_id: params[:order_id])
    @items = OrderItem.where(delivery_order_id: @delivery.ids)

    render json: @delivery.as_json(
      except: [:id, :serving_datetime, :created_at, :updated_at],
      methods: [:delivery_date, :delivery_time],
      include: { order_items: {
        only: [:quantity],
        methods: [:name, :total_price]
      } }
    )
  end

  def feedback
    @feedback = Feedback.all
    render json: @feedback
  end
end
