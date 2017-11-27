require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
 describe "GET #index" do
  it "should render json" do
    get :index
      expect(response).to be_success
  end

  # it "should pass the delivery orders" do
  #   get :index
  #   @newdelivery = build(:delivery_order)
  #   expect(response).to include(@newdelivery)
  # end

  it "assigns @delivery_orders" do
        newdelivery = FactoryBot.create_list(:delivery_order, 3)
        get :index
        expect(assigns(:delivery_orders).to_a).to eq(newdelivery)
      end

  it "should show orderid"
  it "should show delivery_time"
  it "should not show the delivery_order_id"
end

 describe "GET #orders_id" do
  it "should render json"
  it "should show the order items also"
  it "should not show unit_price"
  it "should not show meal_id"

  it "the order items should show name: quantity: and total_price:"
  it "total_price should be integer"
  it "total_price should be quantity*unit_price"
end
end
