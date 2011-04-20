require 'spec_helper'

describe "invoices/new.html.erb" do
  before(:each) do
    assign(:invoice, stub_model(Invoice,
      :invoice_no => "MyString",
      :isbn => "MyString",
      :title => "MyString",
      :publisher => "MyString",
      :author => "MyString",
      :quantity => 1,
      :grossamt => 1.5,
      :currency => "MyString",
      :conv_rate => 1.5,
      :discount => 1.5,
      :netamt => 1.5,
      :received_cnt => "MyString",
      :sold_cnt => "MyString",
      :created_by => 1,
      :updated_by => 1
    ).as_new_record)
  end

  it "renders new invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invoices_path, :method => "post" do
      assert_select "input#invoice_invoice_no", :name => "invoice[invoice_no]"
      assert_select "input#invoice_isbn", :name => "invoice[isbn]"
      assert_select "input#invoice_title", :name => "invoice[title]"
      assert_select "input#invoice_publisher", :name => "invoice[publisher]"
      assert_select "input#invoice_author", :name => "invoice[author]"
      assert_select "input#invoice_quantity", :name => "invoice[quantity]"
      assert_select "input#invoice_grossamt", :name => "invoice[grossamt]"
      assert_select "input#invoice_currency", :name => "invoice[currency]"
      assert_select "input#invoice_conv_rate", :name => "invoice[conv_rate]"
      assert_select "input#invoice_discount", :name => "invoice[discount]"
      assert_select "input#invoice_netamt", :name => "invoice[netamt]"
      assert_select "input#invoice_received_cnt", :name => "invoice[received_cnt]"
      assert_select "input#invoice_sold_cnt", :name => "invoice[sold_cnt]"
      assert_select "input#invoice_created_by", :name => "invoice[created_by]"
      assert_select "input#invoice_updated_by", :name => "invoice[updated_by]"
    end
  end
end
