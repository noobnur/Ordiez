require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it "belongs to a meal"
  it "has a quantity that is more than 1"
  it "has a unit_price"
  it "has a relationship with delivery_order"
end
