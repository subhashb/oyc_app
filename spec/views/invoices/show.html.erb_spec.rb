require 'spec_helper'

describe "invoices/show.html.erb" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Invoice No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Isbn/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Publisher/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Author/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Currency/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Received Cnt/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sold Cnt/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
