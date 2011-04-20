require 'spec_helper'

describe "titlereceipts/index.html.erb" do
  before(:each) do
    assign(:titlereceipts, [
      stub_model(Titlereceipt,
        :po_no => "Po No",
        :invoice_no => "Invoice No",
        :isbn => "Isbn",
        :box_no => 1,
        :created_by => 1,
        :modified_by => 1
      ),
      stub_model(Titlereceipt,
        :po_no => "Po No",
        :invoice_no => "Invoice No",
        :isbn => "Isbn",
        :box_no => 1,
        :created_by => 1,
        :modified_by => 1
      )
    ])
  end

  it "renders a list of titlereceipts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Po No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Invoice No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
