require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
 describe "GET #index" do
  it "should render json" do
    get :index
      expect(response).to be_success
  end

  it "assigns @delivery_orders" do
        newdelivery = FactoryBot.create_list(:delivery_order, 3)
        get :index
        expect(assigns(:delivery_orders).to_a).to eq(newdelivery)
      end

  it "should have valid orderid" do
    newdelivery = FactoryBot.create(:delivery_order)
    get :index
    expect(newdelivery.order_id).should satisfy{/\AGO\d{3}$\z/i}
  end

end
end
