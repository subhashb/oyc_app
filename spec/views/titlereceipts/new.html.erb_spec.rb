require 'spec_helper'

describe "titlereceipts/new.html.erb" do
  before(:each) do
    assign(:titlereceipt, stub_model(Titlereceipt,
      :po_no => "MyString",
      :invoice_no => "MyString",
      :isbn => "MyString",
      :box_no => 1,
      :created_by => 1,
      :modified_by => 1
    ).as_new_record)
  end

  it "renders new titlereceipt form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => titlereceipts_path, :method => "post" do
      assert_select "input#titlereceipt_po_no", :name => "titlereceipt[po_no]"
      assert_select "input#titlereceipt_invoice_no", :name => "titlereceipt[invoice_no]"
      assert_select "input#titlereceipt_isbn", :name => "titlereceipt[isbn]"
      assert_select "input#titlereceipt_box_no", :name => "titlereceipt[box_no]"
      assert_select "input#titlereceipt_created_by", :name => "titlereceipt[created_by]"
      assert_select "input#titlereceipt_modified_by", :name => "titlereceipt[modified_by]"
    end
  end
end
