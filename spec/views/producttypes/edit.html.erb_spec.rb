require 'spec_helper'

describe "producttypes/edit" do
  before(:each) do
    @producttype = assign(:producttype, stub_model(Producttype,
      :name => "MyString"
    ))
  end

  it "renders the edit producttype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", producttype_path(@producttype), "post" do
      assert_select "input#producttype_name[name=?]", "producttype[name]"
    end
  end
end
