require 'spec_helper'

describe "producttypes/show" do
  before(:each) do
    @producttype = assign(:producttype, stub_model(Producttype,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
