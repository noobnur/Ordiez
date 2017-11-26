class CreateDeliveryOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_orders do |t|
      t.string :order_id
      t.timestamp :serving_datetime

      t.timestamps
    end
  end
end
