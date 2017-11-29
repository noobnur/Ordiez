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
    feedback_submitted: [true,false].sample
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

Feedback.create(ratable_id: 123, ratable_type: "DeliveryOrder", rating: 4, comment: "Delivery was prompt and rider was kind, but he forgot cutleries")
Feedback.create(ratable_id: 1, ratable_type: "OrderItem", rating: 3, comment: "The food portion was too little, was alittle hungry after")
Feedback.create(ratable_id: 2, ratable_type: "OrderItem", rating: 5, comment: "It was super tasty and I loved it")
