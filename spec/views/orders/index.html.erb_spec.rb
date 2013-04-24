require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:contracts, [
      stub_model(Contract,
        :client_id => 1,
        :product_id => 2,
        :selling_price => "9.99",
        :difference_price => "9.99",
        :quantity.integer => "Quantity.Integer"
      ),
      stub_model(Contract,
        :client_id => 1,
        :product_id => 2,
        :selling_price => "9.99",
        :difference_price => "9.99",
        :quantity.integer => "Quantity.Integer"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Quantity.Integer".to_s, :count => 2
  end
end
