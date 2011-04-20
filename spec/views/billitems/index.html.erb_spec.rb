require 'spec_helper'

describe "billitems/index.html.erb" do
  before(:each) do
    assign(:billitems, [
      stub_model(Billitem,
        :isbn => "Isbn",
        :title => "Title",
        :mrp => 1.5
      ),
      stub_model(Billitem,
        :isbn => "Isbn",
        :title => "Title",
        :mrp => 1.5
      )
    ])
  end

  it "renders a list of billitems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
