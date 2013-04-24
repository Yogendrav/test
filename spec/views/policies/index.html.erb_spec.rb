require 'spec_helper'

describe "policies/index" do
  before(:each) do
    assign(:policies, [
      stub_model(Policy,
        :agreement_number => "Agreement Number",
        :ic_id => 1,
        :agreement_type => 2,
        :payment_type => 3,
        :annuity => "9.99",
        :client_id => 4
      ),
      stub_model(Policy,
        :agreement_number => "Agreement Number",
        :ic_id => 1,
        :agreement_type => 2,
        :payment_type => 3,
        :annuity => "9.99",
        :client_id => 4
      )
    ])
  end

  it "renders a list of policies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Agreement Number".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
