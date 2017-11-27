class OrderItem < ApplicationRecord
  validates_presence_of :delivery_order_id, :meal_id, :quantity, :unit_price

  belongs_to :delivery_order
  belongs_to :meal

  validates :quantity, numericality: {greater_than_or_equal: 1, less_than_or_equal_to: 10}
  validates :unit_price, numericality: {greater_than_or_equal: 100, less_than_or_equal_to: 100000}

  def total_price
    quantity * unit_price
  end

  def name
  self.meal.name
  end

end
