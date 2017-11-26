require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should belong_to :meal}

  it "the meal_id should not be nil" do
    order = build(:order_item, meal_id: nil)
    expect(order).to_not be_valid
  end

  it "the meal_id should correspond to a valid meal_id" do
    meal = create(:meal)
    order = build(:order_item, meal_id: meal.id)
    expect(order).to be_valid
  end

  it "the delivery_order should not be nil" do
    order = build(:order_item, delivery_order: nil)
    expect(order).to_not be_valid
  end

  it "has a quantity that is 1 or more" do
    order = build(:order_item)
    expect(order.quantity).to be >= 1
  end

  it "has a quantity that is maximum 10" do
    order = build(:order_item)
    expect(order.quantity).to be < 11
  end

  it "has a unit_price" do
    order = build(:order_item, unit_price: nil)
    expect(order).to_not be_valid
  end

  it "unit price must be more than 100 cents" do
    order = build(:order_item)
    expect(order.unit_price).to be >= 100
  end
end
