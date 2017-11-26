require 'rails_helper'

RSpec.describe Meal, type: :model do
  it "is valid with valid attributes" do
    meal = create(:meal, name: "anything", description: "anything")
    expect(meal).to be_valid
  end

  it "is not valid without a name" do
    meal = build(:meal, name: "")
    expect(meal).to_not be_valid
  end

  it "is not valid without a description" do
    meal = build(:meal, description:"")
    expect(meal).to_not be_valid
  end

  it { should have_many :order_items }
end
