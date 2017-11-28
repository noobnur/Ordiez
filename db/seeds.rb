require 'faker'

Meal.destroy_all
OrderItem.destroy_all
DeliveryOrder.destroy_all

10.times do
  Meal.create(
    name: Faker::Food.dish,
    description: "lorem ipsum food description here"
  )
end

5.times do |i|
  DeliveryOrder.create(
    order_id: "GO"+(i+1).to_s.rjust(3,'0'),
    serving_datetime: Faker::Time.between(DateTime.now - 1, DateTime.now),
    feedback: [true, false].sample
  )
end


10.times do
  OrderItem.create(
    delivery_order_id: DeliveryOrder.all.sample.id,
    meal_id: Meal.all.sample.id,
    quantity: [*1..5].sample,
    unit_price: [*100..5000].sample
  )
end
