require 'spec_helper'

describe "policies/show" do
  before(:each) do
    @policy = assign(:policy, stub_model(Policy,
      :agreement_number => "Agreement Number",
      :ic_id => 1,
      :agreement_type => 2,
      :payment_type => 3,
      :annuity => "9.99",
      :client_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Agreement Number/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
    rendered.should match(/4/)
  end
end
