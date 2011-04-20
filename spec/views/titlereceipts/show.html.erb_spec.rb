require 'spec_helper'

describe "titlereceipts/show.html.erb" do
  before(:each) do
    @titlereceipt = assign(:titlereceipt, stub_model(Titlereceipt,
      :po_no => "Po No",
      :invoice_no => "Invoice No",
      :isbn => "Isbn",
      :box_no => 1,
      :created_by => 1,
      :modified_by => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Po No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Invoice No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Isbn/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
