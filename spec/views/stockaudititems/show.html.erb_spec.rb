require 'spec_helper'

describe "stockaudititems/show.html.erb" do
  before(:each) do
    @stockaudititem = assign(:stockaudititem, stub_model(Stockaudititem,
      :bookfair_id => 1,
      :isbn => "Isbn",
      :created_by => 1,
      :modified_by => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Isbn/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
