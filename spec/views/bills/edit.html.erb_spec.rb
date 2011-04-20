require 'spec_helper'

describe "bills/edit.html.erb" do
  before(:each) do
    @bill = assign(:bill, stub_model(Bill,
      :amount => 1.5,
      :quantity => 1
    ))
  end

  it "renders the edit bill form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bills_path(@bill), :method => "post" do
      assert_select "input#bill_amount", :name => "bill[amount]"
      assert_select "input#bill_quantity", :name => "bill[quantity]"
    end
  end
end
