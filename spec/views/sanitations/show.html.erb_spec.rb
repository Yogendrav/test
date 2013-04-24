require 'spec_helper'

describe "sanitations/show" do
  before(:each) do
    @sanitation = assign(:sanitation, stub_model(Sanitation,
      :client_id => 1,
      :address_id => 2,
      :product_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
