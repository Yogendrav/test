require 'spec_helper'

describe "producttypes/index" do
  before(:each) do
    assign(:producttypes, [
      stub_model(Producttype,
        :name => "Name"
      ),
      stub_model(Producttype,
        :name => "Name"
      )
    ])
  end

  it "renders a list of producttypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
