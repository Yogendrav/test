require 'spec_helper'

describe "sanitations/new" do
  before(:each) do
    assign(:sanitation, stub_model(Sanitation,
      :client_id => 1,
      :address_id => 1,
      :product_id => 1
    ).as_new_record)
  end

  it "renders new sanitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sanitations_path, "post" do
      assert_select "input#sanitation_client_id[name=?]", "sanitation[client_id]"
      assert_select "input#sanitation_address_id[name=?]", "sanitation[address_id]"
      assert_select "input#sanitation_product_id[name=?]", "sanitation[product_id]"
    end
  end
end
