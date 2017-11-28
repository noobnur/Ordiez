class AddColumnToDeliveryOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_orders, :feedback, :boolean, default: false
  end
end
