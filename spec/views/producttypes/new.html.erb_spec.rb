require 'spec_helper'

describe "producttypes/new" do
  before(:each) do
    assign(:producttype, stub_model(Producttype,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new producttype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", producttypes_path, "post" do
      assert_select "input#producttype_name[name=?]", "producttype[name]"
    end
  end
end
