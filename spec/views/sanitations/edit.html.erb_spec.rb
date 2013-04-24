require 'spec_helper'

describe "sanitations/edit" do
  before(:each) do
    @sanitation = assign(:sanitation, stub_model(Sanitation,
      :client_id => 1,
      :address_id => 1,
      :product_id => 1
    ))
  end

  it "renders the edit sanitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sanitation_path(@sanitation), "post" do
      assert_select "input#sanitation_client_id[name=?]", "sanitation[client_id]"
      assert_select "input#sanitation_address_id[name=?]", "sanitation[address_id]"
      assert_select "input#sanitation_product_id[name=?]", "sanitation[product_id]"
    end
  end
end
