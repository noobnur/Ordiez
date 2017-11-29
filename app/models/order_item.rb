class OrderItem < ApplicationRecord
  validates_presence_of :delivery_order_id, :meal_id, :quantity, :unit_price

  belongs_to :delivery_order
  belongs_to :meal
  has_one :feedback, as: :ratable

  validates :quantity, numericality: {greater_than_or_equal: 1, less_than_or_equal_to: 10}
  validates :unit_price, numericality: {greater_than_or_equal: 100, less_than_or_equal_to: 100000}

  def total_price
    quantity * unit_price
  end

  def name
  meal.name
  end

  def order_item_id
  (delivery_order.order_items).index(meal.id)
  end

end
