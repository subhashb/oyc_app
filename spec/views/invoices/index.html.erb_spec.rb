require 'spec_helper'

describe "invoices/index.html.erb" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice,
        :invoice_no => "Invoice No",
        :isbn => "Isbn",
        :title => "Title",
        :publisher => "Publisher",
        :author => "Author",
        :quantity => 1,
        :grossamt => 1.5,
        :currency => "Currency",
        :conv_rate => 1.5,
        :discount => 1.5,
        :netamt => 1.5,
        :received_cnt => "Received Cnt",
        :sold_cnt => "Sold Cnt",
        :created_by => 1,
        :updated_by => 1
      ),
      stub_model(Invoice,
        :invoice_no => "Invoice No",
        :isbn => "Isbn",
        :title => "Title",
        :publisher => "Publisher",
        :author => "Author",
        :quantity => 1,
        :grossamt => 1.5,
        :currency => "Currency",
        :conv_rate => 1.5,
        :discount => 1.5,
        :netamt => 1.5,
        :received_cnt => "Received Cnt",
        :sold_cnt => "Sold Cnt",
        :created_by => 1,
        :updated_by => 1
      )
    ])
  end

  it "renders a list of invoices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Invoice No".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Received Cnt".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sold Cnt".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
