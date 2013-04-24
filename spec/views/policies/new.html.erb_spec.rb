require 'spec_helper'

describe "policies/new" do
  before(:each) do
    assign(:policy, stub_model(Policy,
      :agreement_number => "MyString",
      :ic_id => 1,
      :agreement_type => 1,
      :payment_type => 1,
      :annuity => "9.99",
      :client_id => 1
    ).as_new_record)
  end

  it "renders new policy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => policies_path, :method => "post" do
      assert_select "input#policy_agreement_number", :name => "policy[agreement_number]"
      assert_select "input#policy_ic_id", :name => "policy[ic_id]"
      assert_select "input#policy_agreement_type", :name => "policy[agreement_type]"
      assert_select "input#policy_payment_type", :name => "policy[payment_type]"
      assert_select "input#policy_annuity", :name => "policy[annuity]"
      assert_select "input#policy_client_id", :name => "policy[client_id]"
    end
  end
end
