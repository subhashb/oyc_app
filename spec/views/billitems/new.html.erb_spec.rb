require 'spec_helper'

describe "billitems/new.html.erb" do
  before(:each) do
    assign(:billitem, stub_model(Billitem,
      :isbn => "MyString",
      :title => "MyString",
      :mrp => 1.5
    ).as_new_record)
  end

  it "renders new billitem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => billitems_path, :method => "post" do
      assert_select "input#billitem_isbn", :name => "billitem[isbn]"
      assert_select "input#billitem_title", :name => "billitem[title]"
      assert_select "input#billitem_mrp", :name => "billitem[mrp]"
    end
  end
end
