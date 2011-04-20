require 'spec_helper'

describe "bills/show.html.erb" do
  before(:each) do
    @bill = assign(:bill, stub_model(Bill,
      :amount => 1.5,
      :quantity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
