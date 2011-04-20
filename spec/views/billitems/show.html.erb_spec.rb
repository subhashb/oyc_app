require 'spec_helper'

describe "billitems/show.html.erb" do
  before(:each) do
    @billitem = assign(:billitem, stub_model(Billitem,
      :isbn => "Isbn",
      :title => "Title",
      :mrp => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Isbn/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
