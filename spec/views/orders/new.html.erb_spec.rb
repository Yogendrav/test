require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Contract,
      :client_id => 1,
      :product_id => 1,
      :selling_price => "9.99",
      :difference_price => "9.99",
      :quantity.integer => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_client_id", :name => "order[client_id]"
      assert_select "input#order_product_id", :name => "order[product_id]"
      assert_select "input#order_selling_price", :name => "order[selling_price]"
      assert_select "input#order_difference_price", :name => "order[difference_price]"
      assert_select "input#order_quantity.integer", :name => "order[quantity.integer]"
    end
  end
end
