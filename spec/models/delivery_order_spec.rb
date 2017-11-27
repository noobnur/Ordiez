require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  it "is not valid without an order_id" do
    deliveryOrder = build(:delivery_order, order_id: nil)
    expect(deliveryOrder).to_not be_valid
  end

  it "has a string order_id" do
    deliveryOrder = build(:delivery_order)
    expect(deliveryOrder.order_id).to be_a(String)
  end

  it "order_id begins with `GO`" do
    deliveryOrder = build(:delivery_order)
    expect(deliveryOrder.order_id).to start_with("GO")
  end

  it "ends with any number" do
    deliveryOrder = build(:delivery_order)
    breakdown = (deliveryOrder.order_id).split
    lastObj = breakdown[breakdown.length - 1]
    lastNum = lastObj.to_i
    expect(lastNum).to be_a(Integer)
  end

  it "has a serving_datetime" do
    deliveryOrder = build(:delivery_order, serving_datetime: nil)
    expect(deliveryOrder).to_not be_valid
  end

  it { should have_many :order_items }

end
