require 'spec_helper'

describe "sanitations/index" do
  before(:each) do
    assign(:sanitations, [
      stub_model(Sanitation,
        :client_id => 1,
        :address_id => 2,
        :product_id => 3
      ),
      stub_model(Sanitation,
        :client_id => 1,
        :address_id => 2,
        :product_id => 3
      )
    ])
  end

  it "renders a list of sanitations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
