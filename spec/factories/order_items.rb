FactoryBot.define do
  factory :order_item do
    delivery_order
    meal
    quantity 1
    unit_price 100
  end
end
