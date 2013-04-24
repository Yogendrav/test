require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Contract,
      :client_id => 1,
      :product_id => 2,
      :selling_price => "9.99",
      :difference_price => "9.99",
      :quantity.integer => "Quantity.Integer"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/Quantity.Integer/)
  end
end
