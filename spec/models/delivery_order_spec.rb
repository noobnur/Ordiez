require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  it "has an order_id"
  it "has a serving_datetime"
  it "order_id starts with `GO` and ends with a running number"
  it "has one or many order items"
  
end
